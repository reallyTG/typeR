library(mnreadR)


### Name: mnreadParam
### Title: Standard MNREAD parameters' estimation
### Aliases: mnreadParam

### ** Examples

# inspect the structure of the dataframe
head(data_low_vision, 10)

#------

# restrict dataset to one MNREAD test only (subject s1, regular polarity)
data_s1 <- data_low_vision %>%
   filter (subject == "s1", polarity == "regular")

# run the parameters estimation
data_low_vision_param <- mnreadParam(data_s1, ps, vd, rt, err)

# inspect the newly created dataframe
data_low_vision_param

#------

# run the parameters estimation on the whole dataset grouped by subject and polarity
data_low_vision_param <- mnreadParam(data_low_vision, ps, vd, rt, err,
                                           subject, polarity)

# inspect the structure of the newly created dataframe
head(data_low_vision_param, 10)




