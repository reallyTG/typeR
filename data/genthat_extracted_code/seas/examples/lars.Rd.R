library(seas)


### Name: lars
### Title: Read and write data from LARS-WG file formats
### Aliases: lars write.lars read.lars lars2help Summerland.st
###   Summerland.dat write.lars.scenario
### Keywords: file connection utilities

### ** Examples

stfile <- system.file("extdata", "summerland.st", package="seas")
print(stfile)
summ <- read.lars(stfile, year.offset=1960)
head(summ)
str(summ)

# plot temperature
summ$t_mean <- rowMeans(summ[, c("t_min", "t_max")])
seas.temp.plot(summ)

# plot solar radiation
seas.var.plot(summ, "solar")

# plot precipitation
summ.ss <- seas.sum(summ)
image(summ.ss)
plot(seas.norm(summ.ss))



