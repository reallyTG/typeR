library(seas)


### Name: seas.sum
### Title: Seasonal sum data object
### Aliases: seas.sum
### Keywords: datagen

### ** Examples

data(mscdata)
dat <- mksub(mscdata, id=1108447)
dat.ss <- seas.sum(dat, width="mon")

# Structure in R
str(dat.ss)

# Annual data
dat.ss$ann

# Demonstrate how to slice through a cubic array
dat.ss$seas["1990",,]
dat.ss$seas[,2,] # or "Feb", if using English locale
dat.ss$seas[,,"precip"]

# Simple calculation on an array
(monthly.mean <- apply(dat.ss$seas[,,"precip"], 2, mean,na.rm=TRUE))
barplot(monthly.mean, ylab="Mean monthly total (mm/month)",
	main="Un-normalized mean precipitation in Vancouver, BC")
text(6.5, 150, paste("Un-normalized rates given 'per month' should be",
	"avoided since ~3-9% error is introduced",
	"to the analysis between months", sep="\n"))

# Normalized precip
norm.monthly <- dat.ss$seas[,,"precip"] / dat.ss$days
norm.monthly.mean <- apply(norm.monthly, 2, mean,na.rm=TRUE)
print(round(norm.monthly, 2))
print(round(norm.monthly.mean, 2))
barplot(norm.monthly.mean,
    ylab="Normalized mean monthly total (mm/day)",
	main="Normalized mean precipitation in Vancouver, BC")

# Better graphics of data
dat.ss <- seas.sum(dat, width=11)
image(dat.ss)



