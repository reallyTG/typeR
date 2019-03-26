## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning=FALSE
)

## ----eval=FALSE----------------------------------------------------------
#  library("devtools")
#  devtools::install_github("jhudsl/crsra", build_vignettes = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  my_import <- crsra_import(workdir = ".", check_problems = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  user_table <- my_import[["Regression Models"]][["users"]]

## ----eval=FALSE----------------------------------------------------------
#  library(dplyr)
#  user_table <- my_import %>%
#      .[["Regression Models"]] %>%
#      .[["users"]]

## ----eval=FALSE----------------------------------------------------------
#  my_course_import <- crsra_import_course(workdir = ".", check_problems = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  user_table_2 <- my_course_import[["users"]]

## ----eval=FALSE----------------------------------------------------------
#  library(dplyr)
#  user_table_2 <- my_course_import %>%
#      .[["users"]]

## ----eval=FALSE----------------------------------------------------------
#  my_import %>%
#      .[["Regression Models"]] %>%
#      .[["course_item_grades"]] %>%
#      filter(course_item_id == "67c1O") %>%
#      filter(course_item_passing_state_id == 2) %>%
#      summarise(n = n())
#  
#  # A tibble: 1 x 1
#  #      n
#  #   <int>
#  # 1  8640

## ----eval=FALSE----------------------------------------------------------
#  crsra_gradesummary(my_import, groupby = "gender") %>%
#      .[["Regression Models"]]
#  
#  #Note that maximum grade possible is 1.
#  # A tibble: 2 x 2
#  #  reported_or_inferred_gender  AvgGrade
#  #                        <chr>     <dbl>
#  #1                        male 0.7250660
#  #2                      female 0.6691554

## ----eval=FALSE----------------------------------------------------------
#  ttf <- crsra_timetofinish(my_import)

## ---- eval=FALSE---------------------------------------------------------
#  ttf_status <- ttf %>%
#      .[["Getting and Cleaning Data"]] %>%
#      left_join(my_import[["Getting and Cleaning Data"]][["users"]],
#                       by = "jhu_user_id", `copy`=TRUE) %>%
#      filter(!is.na(student_status))

## ----eval=FALSE----------------------------------------------------------
#  passed_items <- my_import %>%
#      .[["Getting and Cleaning Data"]] %>%
#      .[["course_progress"]] %>%
#      group_by(jhu_user_id) %>%
#      # 604800 is the number of seconds in a week
#      filter(course_progress_ts <= min(course_progress_ts) + 604800) %>%
#      summarise(nweek1 = n())

## ----eval=FALSE----------------------------------------------------------
#  gaps <- my_import %>%
#      .[["Getting and Cleaning Data"]] %>%
#      .[["course_progress"]] %>%
#      # 2 is an indicator that the course item is completed
#      filter(course_progress_state_type_id == 2) %>%
#      group_by(jhu_user_id, course_item_id) %>%
#      # This is for keeping only the latest event for each course item
#      filter(course_progress_ts == max(course_progress_ts)) %>%
#      ungroup() %>%
#      arrange(jhu_user_id, course_progress_ts) %>%
#      group_by(jhu_user_id) %>%
#      # This is for converting the time gap to hours
#      mutate(time.dif = as.numeric(course_progress_ts -
#                                              lag(course_progress_ts))/3600) %>%
#      filter(!is.na(time.dif)) %>%
#      filter(time.dif != Inf | time.dif != -Inf)

## ----eval=FALSE----------------------------------------------------------
#  gaps_payment <- gaps %>%
#      group_by(jhu_user_id) %>%
#      summarise(avgtime = mean(time.dif)) %>%
#      inner_join(my_import[["Getting and Cleaning Data"]][["course_grades"]],
#                        by = "jhu_user_id", `copy`=TRUE) %>%
#      filter(course_passing_state_id %in% c(1, 2)) %>%
#      left_join(
#          my_import[["Getting and Cleaning Data"]][["users_courses__certificate_payments"]],
#          by = "jhu_user_id", `copy`=TRUE) %>%
#      filter(!is.na(was_payment)) %>%
#      group_by(was_payment) %>%
#      summarise(avggap=mean(avgtime))

## ----eval=FALSE----------------------------------------------------------
#  passed_items_policy <- passed_items %>%
#      left_join(my_import[["Getting and Cleaning Data"]][["course_memberships"]],
#                       by = "jhu_user_id", `copy`=TRUE) %>%
#      filter(!is.na(course_membership_ts)) %>%
#      mutate(subscription = ifelse(course_membership_ts < "2016-11-01 00:00:00",
#                                          "before", "after")) %>%
#      group_by(subscription) %>%
#      summarise(subnw = mean(nweek1))

