## ----setup, echo = FALSE, cache = FALSE----------------------------------
suppressWarnings({
  suppressPackageStartupMessages({
    loadNamespace("knitr") # for opts_chunk only
    library("icd")
    library("magrittr")
    library("utils")
    })
  })

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

patients_icd9 <- data.frame(
  visit_id = c(1000, 1000, 1000, 1000, 1001, 1001, 1002),
  icd9 = as.icd9(c("40201", "2258", "7208", "25001", "34400", "4011", "4011")),
  poa = c("Y", NA, "N", "Y", "X", "Y", "E"),
  stringsAsFactors = FALSE
  )

## ----quickstart----------------------------------------------------------
library(icd)
head(uranium_pathology, 10)
head(comorbid_charlson(uranium_pathology))
comorbid_charlson(uranium_pathology, 
                  return_df = TRUE,
                  return_binary = TRUE)[1:5, 1:5]
hist(charlson(uranium_pathology), 
     main = "Histogram of Charlson scores in Uranium data",
     xlab = "Charlson Score")

## ----pkgdesc, results='asis', echo = FALSE-------------------------------
cat(utils::packageDescription("icd")$Description)

## ----show data formats, echo=TRUE----------------------------------------
# long format ICD-9-CM codes, with present-on-arrival flags
patients_icd9

# long format ICD-10 codes, real mortality data
uranium_pathology[1:5, ]

# wide format, real ICD-9 discharge diagnoses
vermont_dx[1:5, c(1, 6:15)]

## ----getcomorbidities----------------------------------------------------
# use AHRQ revision of Elixhauser comorbidities, show only first eight columns
comorbid_ahrq(patients_icd9)[, 1:8]

## ----getcomorbidities2---------------------------------------------------
# find Elixhauser comorbidities which were present-on-arrival
patients_icd9 %>% filter_poa %>% comorbid_elix

# same as above, then summarize five columns:
patients_icd9 %>%
  filter_poa %>%
  comorbid_elix %>%
  extract(, 5:10) %>%
  colSums

# convert vermont discharge data to wide format, 
# find comorbidities, convert TRUE to 1 and show first few
vermont_cmb <- vermont_dx %>% wide_to_long %>% 
  icd9_comorbid_quan_deyo %>%
  apply(2, as.integer) # convert logical to integer

head(vermont_cmb)

barplot(colSums(vermont_cmb[, 1:5]),
        main = "Incidence of Elixhauser Comorbidities in Vermont data")



## ----lots of brackets, eval = FALSE--------------------------------------
#  head(apply(icd9_comorbid_quan_deyo(wide_to_long(vermont_dx)), 2, as.integer))

## ----type guessing-------------------------------------------------------
is_valid("100") # valid ICD-9 code
is_valid("A1001") # valid ICD-10 code
is_valid(c("100", "A1001")) # they can't both be valid

## ----set type------------------------------------------------------------
# decimal format ICD-10 codes
codes <- c("A10.01", "L40.50", "Z77.098")
# set class to be icd10cm (and implicitly icd10)
as.icd10cm(codes)
# indicate decimal code and icd10 (not necessarily icd10cm)
codes %>% as.decimal_diag %>% as.icd10

## ----simple conversion---------------------------------------------------
decimal_to_short(c("1", "10.20", "100", "123.45"))
short_to_decimal(c("1", "22", "2244", "1005"))

# similar operations with magrittr, also showing invalid codes
codes <- as.icd9(c("87.65", "9999", "Aesop", -100, "", NA))
decimal_to_short(codes)

# ICD-10
decimal_to_short("T81.10XD")


## ----validation----------------------------------------------------------
# guess both ICD version (9, but could be 10?), and decimal vs short form
is_valid("V10.2")

# state we are using short or decimal codes:
is_valid(c("099.17", "-1"), short_code = TRUE)
is_valid(c("099.17", "-1.1"), short_code = FALSE)
is_valid(c("1", "001", "100", "123456", "003.21"), short_code = TRUE)

## ----explain simple------------------------------------------------------
explain_code("1.0") # 'decimal' format code inferred
explain_code("0019") # 'short' format code inferred

## ----explain complex-----------------------------------------------------
# we can be explicit about short vs decimal
explain_code("434.00", short_code = FALSE)
explain_code(c("43410", "43491"), short_code = TRUE)
#explain top level code with children
"391" %>% explain_code # single three-digit code
"391" %>% children # let's see the child codes
"391" %>% children %>% explain_code # children condensed to parent code
"391" %>% children %>% explain_code(condense = FALSE) # prevent condense

## ----explainarbitrary----------------------------------------------------
explain_code(list(somecodes = as.icd9(c("001", "391")),
                 morecodes = as.icd9cm(c("001.1", "001.9"))))

## ----cholera-------------------------------------------------------------
explain_code(list(cholera = "001", rheumatic_heart = "390"))

## ----noexplain, eval = FALSE---------------------------------------------
#  s <- explain_code("001.5") # gives warning

## ----Example Dementia----------------------------------------------------
length(icd9_map_quan_deyo[["Dementia"]]) # 133 possible ICD-9 codes
length(icd10_map_quan_deyo[["Dementia"]]) # the ICD-10 map is different
# explain_code summarizes these to just two groups:
icd9_map_quan_deyo[["Dementia"]] %>% explain_code(warn = FALSE)
# contrast with:
icd9_map_quan_deyo[["Dementia"]] %>% explain_code(condense = TRUE, warn = FALSE)

## ----Show Range Operator-------------------------------------------------
length("390" %i9da% "392.1")
"390" %i9da% "392.1" %>% explain_code(warn = FALSE)

## ----Show POA Choices, echo=FALSE----------------------------------------
poa_choices

## ----simplepoa-----------------------------------------------------------
patients_icd9 %>% filter_poa_yes

## ----notnopoa------------------------------------------------------------
patients_icd9 %>% filter_poa_not_no

## ----ahrq----------------------------------------------------------------
names(icd9_map_ahrq)
icd9_map_ahrq$CHF[1:5]
icd10_map_ahrq$CHF[1:5]

## ----elix----------------------------------------------------------------
# the names of the comorbidities in each map are available as named lists:
names_elix[1:5]
unlist(unname(names_elix))
# The map contents have ICD codes with the class set
icd9_map_elix$HTNcx
icd10_map_elix$HTNcx

## ----quan elix-----------------------------------------------------------
names(icd10_map_quan_deyo)
names(icd10_map_quan_elix)

## ----chainpoatocomorbid--------------------------------------------------
patients_icd9 %>%
  filter_poa_not_no %>%
  icd9_comorbid_ahrq %>%
  extract(1:9)

## ----elixvsquanelix------------------------------------------------------
difference <- diff_comorbid(icd9_map_elix, icd9_map_quan_elix,
                            all_names = c("CHF", "PHTN", "HTN", "Valvular"))
# reuslts also returned as data
str(difference)

## ----quanonlyphtn--------------------------------------------------------
difference$PHTN$only.y %>% get_defined %>% explain_code

## ----cardiacgrep---------------------------------------------------------
icd9cm_hierarchy[
  grepl(pattern = "(heart)|(cardiac)",
        x = c(icd9cm_hierarchy$long_desc, icd9cm_hierarchy$short_desc),
        ignore.case = TRUE),
  "code"] %>% unique -> cardiac

## ----cardiac Chain Explain Example---------------------------------------
as.icd9(cardiac) %>% explain_code(warn = FALSE) %>% head(10)

## ----speed, eval = FALSE-------------------------------------------------
#  # codes selected from AHRQ mapping
#  many_patients <- icd:::generate_random_pts(1e7)
#  system.time(
#    comorbid_ahrq(many_patients)
#    )[["elapsed"]]

## ----arbitrary Mapping---------------------------------------------------
names(icd9_chapters)[c(1:5, 14)]
my_map <- icd:::icd9_chapters_to_map(icd9_chapters[c(2, 5, 14)])
icd9_comorbid(patients_icd9, my_map) # no positive 

## ----realmapping---------------------------------------------------------
ahrq_strict <- lapply(icd9_map_ahrq, get_defined)
str(icd9_map_ahrq[1:5]) # first five of the original:
str(ahrq_strict[1:5]) # and first five of the result:

## ----"compare ICD-9 versions"--------------------------------------------
new_since_27 <- setdiff(icd9cm_billable[["32"]][["code"]],
                         icd9cm_billable[["27"]][["code"]]) %>% head
lost_since_27 <- setdiff(icd9cm_billable[["27"]][["code"]],
                         icd9cm_billable[["32"]][["code"]]) %>% tail
# we know this is an ICD-9-CM code, so declare this using nice magrittr motif:
lost_since_27 %<>% as.icd9cm
lost_since_27 %<>% as.icd9cm

# these are a few which were gained since v27
data.frame(code = new_since_27, desc = new_since_27 %>% explain_code)
# these are a few which were lost since v27
data.frame(code = lost_since_27, desc = lost_since_27 %>% explain_code)

