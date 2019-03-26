library(mnreadR)


### Name: readingAcuity
### Title: Reading Acuity (RA) calculation
### Aliases: readingAcuity

### ** Examples

# inspect the structure of the dataframe
head(data_low_vision, 10)

#------

# restrict dataset to one MNREAD test only (subject s1, regular polarity)
data_s1 <- data_low_vision %>% filter (subject == "s1" & polarity == "regular")

# run the reading acuity calculation
data_low_vision_RA <- readingAcuity(data_s1, ps, vd, rt, err)

# inspect the newly created dataframe
data_low_vision_RA

#------

# run the reading acuity calculation on the whole dataset grouped by subject and polarity
data_low_vision_RA <- readingAcuity(data_low_vision, ps, vd, rt, err,
                                    subject, polarity)

# inspect the structure of the newly created dataframe
head(data_low_vision_RA, 10)




