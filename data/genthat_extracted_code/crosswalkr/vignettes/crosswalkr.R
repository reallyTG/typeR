## ---- message = FALSE----------------------------------------------------
library(crosswalkr)
library(dplyr)
library(labelled)
library(haven)

## ---- echo = FALSE-------------------------------------------------------
file_1 <- data.frame(sid = c(1:3),
                     lname = c('Jackson','Harrison','Nixon'),
                     stat = c('VA','KY','IL'),
                     t_score = c(74,86,78),
                     stringsAsFactors = FALSE)

file_2 <- data.frame(stu_id = c(4:6),
                     last_name = c('Washington','Roosevelt','Taylor'),
                     st = c(35,11,47),
                     test_score = c(92,82,89),
                     stringsAsFactors = FALSE)

file_3 <- data.frame(s_id = c(7:9),
                     name = c('Tyler','Grant','Adams'),
                     sta = c('North Dakota','South Dakota','Illinois'),
                     score = c(91,82,89),
                     stringsAsFactors = FALSE)

## ------------------------------------------------------------------------
df1 <- file_1 %>%
    rename(id = sid,
           last_name = lname,
           stabbr = stat,
           score = t_score)

df2 <- file_2 %>%
    rename(id = stu_id,
           stabbr = st,
           score = test_score) %>%
    mutate(stabbr = as.character(stabbr))

df3 <- file_3 %>%
    rename(id = s_id,
           stabbr = sta,
           last_name = name)

df <- rbind(df1, df2, df3)
df


## ---- echo = FALSE-------------------------------------------------------
crosswalk <- data.frame(clean = c('id','last_name','stabbr','score'),
                        label = c('Student ID','Student last name',
                                  'State abbreviation','Test score'),
                        file_1_raw = c('sid','lname','stat','t_score'),
                        file_2_raw = c('stu_id','last_name','st','test_score'),
                        file_3_raw = c('s_id','name','sta','score'),
                        stringsAsFactors = FALSE)

## ------------------------------------------------------------------------
df1 <- renamefrom(file_1, cw_file = crosswalk, raw = file_1_raw, clean = clean, label = label)
df2 <- renamefrom(file_2, cw_file = crosswalk, raw = file_2_raw, clean = clean, label = label)
df3 <- renamefrom(file_3, cw_file = crosswalk, raw = file_3_raw, clean = clean, label = label)

df <- rbind(df1, df2, df3)
df

## ------------------------------------------------------------------------
var_label(df)

## ------------------------------------------------------------------------

data(stcrosswalk)
stcrosswalk


## ------------------------------------------------------------------------
df1$state <- encodefrom(file_1, var = stat, stcrosswalk, raw = stabbr, clean = stfips, label = stname)
df1
sapply(df1, class)


## ------------------------------------------------------------------------
file_1_ <- file_1 %>% tbl_df()
df1$state <- encodefrom(file_1_, var = stat, stcrosswalk, raw = stabbr,
                        clean = stfips, label = stname)
as_factor(df1)
zap_labels(df1)

## ------------------------------------------------------------------------
df <- rbind(file_1 %>%
            tbl_df() %>%
            renamefrom(., crosswalk, file_1_raw, clean, label) %>%
            mutate(stabbr = encodefrom(., stabbr, stcrosswalk, stabbr, stfips, stname)),

            ## append file 2
            file_2 %>%
            tbl_df() %>%
            renamefrom(., crosswalk, file_2_raw, clean, label) %>%
            mutate(stabbr = encodefrom(., stabbr, stcrosswalk, stfips, stfips, stname)),

            ## append file 3
            file_3 %>%
            tbl_df() %>%
            renamefrom(., crosswalk, file_3_raw, clean, label) %>%
            mutate(stabbr = encodefrom(., stabbr, stcrosswalk, stname, stfips, stname)))

df
as_factor(df)            

