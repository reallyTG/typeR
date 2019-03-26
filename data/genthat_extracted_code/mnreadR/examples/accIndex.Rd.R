library(mnreadR)


### Name: accIndex
### Title: Reading ACCessibility Index (ACC) calculation
### Aliases: accIndex

### ** Examples

# inspect the structure of the dataframe
head(data_low_vision, 10)

#------

# restrict dataset to one MNREAD test only (subject s1, regular polarity)
data_s1 <- data_low_vision %>%
   filter (subject == "s1", polarity == "regular")

# run the reading accessibility index calculation
data_low_vision_ACC <- accIndex(data_s1, ps, rt, err)

# inspect the newly created dataframe
data_low_vision_ACC

#------

# run the reading accessibility index calculation
# on the whole dataset grouped by subject and polarity
data_low_vision_ACC <- accIndex(data_low_vision, ps, rt, err,
                               subject, polarity)

# inspect the structure of the newly created dataframe
head(data_low_vision_ACC, 10)




