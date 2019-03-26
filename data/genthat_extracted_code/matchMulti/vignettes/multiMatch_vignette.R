## ----data1, eval=FALSE---------------------------------------------------
#  library(matchMulti)
#  
#  data(catholic_schools)
#  
#  catholic_schools$sectorf <- factor(catholic_schools$sector,
#                              label=c("Public", "Catholic"))
#  
#  #Number of Treated Schools
#  length(table(catholic_schools$school[
#    catholic_schools$sector==1]))
#  
#  #Number of Controls Schools
#  length(table(catholic_schools$school[
#    catholic_schools$sector==0]))
#  

## ----plot, eval=FALSE----------------------------------------------------
#  # Create Discrete Measures from Continuous Covariates
#  library(ggplot2)
#  
#  # A Boxplot for the size of the school
#  ggplot(catholic_schools, aes(x=sectorf, y=size,
#                               fill=sectorf)) +
#    geom_boxplot() + guides(fill=FALSE) +
#    xlab("") + ylab("School Enrollment")

## ----plot2, eval=FALSE---------------------------------------------------
#  ggplot(catholic_schools, aes(x=sectorf, y=female_mean,
#                               fill=sectorf)) +
#    geom_boxplot() + guides(fill=FALSE) +
#    xlab("") + ylab("Percentage of Female Students")

## ----trim, eval=FALSE----------------------------------------------------
#  library(dplyr)
#  summary(catholic_schools$female_mean)
#  summary(catholic_schools$female_mean[
#    catholic_schools$sector==1])
#  summary(catholic_schools$female_mean[
#    catholic_schools$sector==0])
#  catholic_schools <- catholic_schools %>%
#    filter(female_mean>.30, female_mean<.75)
#  summary(catholic_schools$female_mean)

## ----bal, eval=FALSE-----------------------------------------------------
#  student.cov <- c('minority','female','ses')
#  school.cov <- c('minority_mean', 'female_mean', 'size',
#                  'acad', 'discrm', 'ses_mean')
#  all.cov <- c('minority','female','ses','minority_mean',
#               'female_mean', 'size', 'acad',
#               'discrm', 'ses_mean')
#  
#  #look at balance on students before matching
#  balanceTable(catholic_schools[c(all.cov,'sector')],
#               treatment = 'sector')

## ----no_stu, eval=FALSE--------------------------------------------------
#  match.simple <- matchMulti(catholic_schools,
#                             treatment = 'sector',
#                             school.id = 'school',
#                             match.students = FALSE,
#                             student.vars = student.cov,
#                             verbose=TRUE)
#  
#  # Check Balance
#  bal.tab <- balanceMulti(match.simple,
#                          student.cov = student.cov,
#                          school.cov = school.cov)
#  
#  out <- cbind(bal.tab$schools[,3], bal.tab$schools[,6])
#  colnames(out) <- c("S.Diff Before", "S.Diff After")
#  round(out, 3)

## ----no_stu2, eval=FALSE-------------------------------------------------
#  match.out <- matchMulti(catholic_schools,
#                          treatment = 'sector',
#                          school.id = 'school',
#                          match.students = TRUE,
#                          student.vars = student.cov)
#  # Check Balance
#  bal.tab.stu <- balanceMulti(match.out,
#                              student.cov = student.cov,
#                              school.cov = school.cov)

## ----cut, eval=FALSE-----------------------------------------------------
#  # Create Discrete Measures from Continuous Covariates
#  catholic_schools$acad_cut <- cut(catholic_schools$acad, 6)
#  catholic_schools$size_cut <- cut(catholic_schools$size, 6)
#  catholic_schools$discrm_cut <- cut(catholic_schools$discrm, 6)
#  catholic_schools$ses_cut <- cut(catholic_schools$ses_mean, 6)

## ----fine.bal, eval=FALSE------------------------------------------------
#  # Match with Fine Balance
#  match.fb <- matchMulti(catholic_schools,
#                         treatment = 'sector',
#                         school.id = 'school',
#                         match.students = TRUE,
#                         verbose=TRUE,
#                         student.vars = student.cov,
#                         school.fb = list(c('size_cut',
#                                            'acad_cut',
#                                            'discrm_cut',
#                                            'ses_cut')))
#  # Balance Check
#  bal.tab.fb <- balanceMulti(match.fb,
#                             student.cov = student.cov,
#                             school.cov)

## ----match.fb2, eval=FALSE-----------------------------------------------
#  match.fb2 <- rematchSchools(match.fb,
#                              catholic_schools,
#                              school.fb = list(c('acad_cut',
#                                                 'discrm_cut'),
#                                               c('size_cut',
#                                                 'acad_cut',
#                                                 'discrm_cut',
#                                                 'ses_cut')))
#  
#  
#  bal.tab3 <- balanceMulti(match.fb2,
#                           student.cov = student.cov,
#                           school.cov)

## ----opt_subset, eval=FALSE----------------------------------------------
#  # Trim Schools
#  # How many treated schools are left after
#  # dropping single-gender schools?
#  length(table(catholic_schools$school[
#    catholic_schools$sector==1]))
#  
#  match.fb4 <- rematchSchools(match.fb,
#                              catholic_schools,
#                              school.fb = list(c('acad_cut',
#                                                 'discrm_cut'),
#                                               c('size_cut',
#                                                 'acad_cut',
#                                                  'discrm_cut',
#                                                 'ses_cut')),
#                              keep.target = 10,
#                              tol = 0.1)
#  
#  bal.tab4 <- balanceMulti(match.fb4,
#                           student.cov = student.cov,
#                          school.cov = c(school.cov))
#  

## ----hlm, eval=FALSE-----------------------------------------------------
#  #Use an HLM for Outcome Analysis
#  match.data <- as.data.frame(match.fb4$matched)
#  head(match.data)
#  library(nlme)
#  out <- lme(mathach ~ sector, random = ~ 1 |
#               pair.id/school, data=match.data)
#  summary(out)
#  

## ----randinf, eval=FALSE-------------------------------------------------
#  output.fb <- matchMultioutcome(match.fb4, out.name = "mathach",
#                                 schl_id_name = "school",
#                                 treat.name = "sector")

## ----sens1, eval=FALSE---------------------------------------------------
#  #Compare to Less Balanced Match
#  matchMultisens(match.fb4, out.name = "mathach",
#            schl_id_name = "school",
#            treat.name = "sector")

## ----sens2, eval=FALSE---------------------------------------------------
#  matchMultisens(match.fb, out.name = "mathach",
#            schl_id_name = "school",
#            treat.name = "sector")
#  

## ----sens3, eval=FALSE---------------------------------------------------
#  matchMultisens(match.fb, out.name = "mathach",
#            schl_id_name = "school",
#            treat.name = "sector", Gamma=2.17)

