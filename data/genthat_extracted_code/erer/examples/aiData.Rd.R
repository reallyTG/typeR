library(erer)


### Name: aiData
### Title: Transforming Raw Data for Static AIDS Model
### Aliases: aiData print.aidata
### Keywords: manip

### ** Examples


data(daBedRaw)
dumm <- list(dum1 = c(2003, 10, 2003, 10), dum2 = c(2004, 7, 2004, 7),
  dum3 = c(2005, 1, 2005, 1))
imp8 <- aiData(x = daBedRaw,
  label = c("CN", "VN", "ID", "MY", "CA", "BR", "IT"),
  label.tot = "WD", prefix.value = "v", prefix.quant = "q",
  start = c(2001, 1), end = c(2008, 12), dummy = dumm)
imp4 <- update(imp8, label = c("CN", "VN", "ID"))
imp5 <- update(imp4, label = c("CN", "VN", "ID", "MY"))
imp8; imp4; imp5
daTest <- imp8$out
colnames(daTest)[18:20] <- c("dum1", "dum2", "dum3")
head(daTest)

data(daBed)
head(daTest); head(daBed)
identical(daBed, daTest)



