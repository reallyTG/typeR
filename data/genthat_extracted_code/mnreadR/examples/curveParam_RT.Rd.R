library(mnreadR)


### Name: curveParam_RT
### Title: Standard estimation of Maximum Reading Speed (MRS) and Critical
###   Print Size (CPS) using individual data of reading time and number of
###   errors.
### Aliases: curveParam_RT

### ** Examples

# inspect the structure of the dataframe
head(data_low_vision, 10)

#------

# restrict dataset to one MNREAD test only (subject s1, regular polarity)
data_s1 <- data_low_vision %>%
   filter (subject == "s1", polarity == "regular")

# run the parameters estimation
data_low_vision_MRS_CPS <- curveParam_RT(data_s1, ps, vd, rt, err)

# inspect the newly created dataframe
data_low_vision_MRS_CPS

#------

# run the parameters estimation on the whole dataset grouped by subject and polarity
data_low_vision_MRS_CPS <- curveParam_RT(data_low_vision, ps, vd, rt, err,
                                           subject, polarity)

# inspect the structure of the newly created dataframe
head(data_low_vision_MRS_CPS, 10)




