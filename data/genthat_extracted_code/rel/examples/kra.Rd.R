library(rel)


### Name: kra
### Title: Krippendorff's alpha
### Aliases: kra
### Keywords: univar

### ** Examples

#Sample data: 4 raters, 12 subjects, and 5 ordinal scale response categories.
data <- cbind(rbind(1,2,3,3,2,1,4,1,2,NA,NA,NA),
              rbind(1,2,3,3,2,2,4,1,2,5,NA,3),
              rbind(NA,3,3,3,2,3,4,2,2,5,1,NA),
              rbind(1,2,3,3,2,4,4,1,2,5,1,NA))

#Krippendorff's alpha for ordinal scale data
kra(data = data, metric = "ordinal", conf.level = 0.95, R = 0)



