## ---- echo = FALSE-------------------------------------------------------
if (!require(MonetDBLite)) {
  message("Could not find MonetDBLite so could not run vignette.")
  knitr::opts_chunk$set(eval = FALSE)
}

if (!file.exists("acs_m.Rdata")) {
  message("Could not find db file so could not run vignette.")
  knitr::opts_chunk$set(eval = FALSE)
}

## ------------------------------------------------------------------------
suppressMessages({
  library(MonetDBLite)
  library(survey)
  library(srvyr)
  library(dplyr)
  library(dbplyr)
  library(RSQLite)
})

# Load data (Currently only Alaska and Hawaii to keep file size small and with 
# limited variables, butcode that downloaded the files is available here
# https://github.com/gergness/srvyr/blob/master/vignettes/save_acs_data.R
# and could easily be adapted to download all states.)
load("acs_m.Rdata") # acs_m data

# Set up database and table
db <- src_monetdblite()
acs_m_db <- copy_to(db, acs_m, "acs_m", temporary = FALSE)

# Make table read only to reflect real world usage (see advanced topics below).
db_status <- dbSendQuery(acs_m_db$src$con, "ALTER TABLE acs_m SET READ ONLY")

# Or, if the data was already stored in the database, you could do this
# acs_m_data <- tbl(db, sql("SELECT * FROM acs_m")) 

## ------------------------------------------------------------------------
# Same results
acs_m %>% 
  group_by(sex) %>%
  summarize(hicov = mean(hicov))

acs_m_db %>% 
  group_by(sex) %>%
  summarize(hicov = mean(hicov))

# But smaller object size
object.size(acs_m)
object.size(acs_m_db)


## ------------------------------------------------------------------------
acs_m %>% 
  group_by(sex) %>%
  summarize(hicov = mean(hicov == 1))

# acs_m_db %>% 
#   group_by(sex) %>%
#   summarize(hicov = mean(hicov == 1))
#
# > Error in .local(conn, statement, ...) :
# > Unable to execute statement....
# > ....

# Creating the variable separately works as an integer works though
acs_m_db %>% 
  group_by(sex) %>%
  mutate(hicov = ifelse(hicov == 1, 1L, 0L)) %>%
  summarize(hicov = mean(hicov))

## ------------------------------------------------------------------------
acs_m %>% 
  group_by(agecat = cut(agep, c(0, 19, 35, 50, 65, 200))) %>%
  summarize(hicov = mean(hicov == 1))

# acs_m_db %>% 
#   group_by(agecat = cut(agep, c(0, 19, 35, 50, 65, 200))) %>%
#   summarize(hicov = mean(hicov == 1))
#
# > Error in .local(conn, statement, ...) :
# > Unable to execute statement....
# > ...

acs_m_db %>% 
  mutate(agecat = ifelse(agep < 19, "0-18", 
                         ifelse(agep >= 19 & agep < 35, "19-34", 
                                ifelse(agep >= 35 & agep < 50, "35-49", 
                                       ifelse(agep >= 50 & agep < 65, "50-64", 
                                              ifelse(agep >= 65, "65+", NA)))))) %>%
  group_by(agecat) %>% 
  summarize(hicov = mean(hicov))

## ------------------------------------------------------------------------
acs_m_db_svy <- acs_m_db %>% 
  as_survey_rep(
    weight = pwgtp,
    repweights = matches("pwgtp[0-9]+") ,
    scale = 4 / 80,
    rscales = rep(1 , 80),
    mse = TRUE,
    type = "JK1", 
    variables = -c(matches("^pwgtp"))
  )

acs_m_db_svy

## ------------------------------------------------------------------------
object.size(acs_m_db_svy)

## ------------------------------------------------------------------------
# You can calculate the population of the united states #
# by state
acs_m_db_svy %>%
  mutate(one = 1L) %>% # Note that because of weird behavior of MonetDB, need to use 1L not just 1
  group_by(st) %>% 
  summarize(count = survey_total(one))

# Or the average age of downloaded states
acs_m_db_svy %>%
  summarize(agep = survey_mean(agep, na.rm = TRUE))

# Average age by state
acs_m_db_svy %>%
  group_by(st) %>% 
  summarize(agep = survey_mean(agep, na.rm = TRUE))

# percent uninsured - nationwide (of downloaded states)
acs_m_db_svy %>%
  mutate(hicov = as.character(hicov)) %>% 
  group_by(hicov) %>% 
  summarize(pct = survey_mean(na.rm = TRUE))

# by state
acs_m_db_svy %>%
  mutate(hicov = as.character(hicov)) %>% 
  group_by(st, hicov) %>% 
  summarize(pct = survey_mean(na.rm = TRUE))


# 25th, median, and 75th percentile of age of residents of the united states (downloaded states)
acs_m_db_svy %>%
  summarize(agep = survey_quantile(agep, c(0.25, 0.5, 0.75), na.rm = TRUE))


# Filter works, so we can restrict the acs_m object to females only
acs_m_db_svy_female <- acs_m_db_svy %>%
  filter(sex == 2)

# Now any of the above commands can be re-run using the acs_m_female object
# instead of the acs_m object in order to analyze females only

# This is equivalent to using acs_m, and applying the filter every time.

# average age - nationwide (of downloaded states), restricted to females
acs_m_db_svy_female %>%
  summarize(agep = survey_mean(agep, na.rm = TRUE))

# median age - nationwide (of downloaded states), restricted to females
acs_m_db_svy_female %>%
  summarize(agep = survey_median(agep, na.rm = TRUE))


# Note that though some R functions are translated by dplyr into SQL, not
# all of them are. For example, when constructing a new age category 
# variable in the dataset neither findIntervals nor cut work on databases, 
# so we have to spell out groups with ifelse()
acs_m_db_svy %>% 
  mutate(agecat = ifelse(agep < 19, "0-18", 
                         ifelse(agep >= 19 & agep < 35, "19-34", 
                                ifelse(agep >= 35 & agep < 50, "35-49", 
                                       ifelse(agep >= 50 & agep < 65, "50-64", 
                                              ifelse(agep >= 65, "65+", NA)))))) %>%
  group_by(agecat) %>% 
  summarize(pct = survey_mean(na.rm = TRUE))

## ------------------------------------------------------------------------
acs_m_db_svy %>%
  select(agep, hicov, sex) %>%
  collect() %>%
  {survey::svyglm(hicov ~ sex + agep, .)} %>%
  summary()

