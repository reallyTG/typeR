library(drsmooth)


### Name: prelimstats
### Title: Preliminary Statistics
### Aliases: prelimstats

### ** Examples

# Prints all available preliminary tests:
prelimstats("dose", data=DRdata)

# Prints only the outlier test:
prelimstats("dose", tests="outlier", data=DRdata)

# Prints only the homogeneity and normality tests:
prelimstats("dose", tests=c("bartlett", "shapiro"), data=DRdata)



