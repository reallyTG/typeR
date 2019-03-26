library(acs)


### Name: plot-methods
### Title: acs Methods for Function 'plot'
### Aliases: plot plot-methods plot,acs-method plot,acs,acs-method
### Keywords: methods

### ** Examples


# load ACS data
data(kansas07)

# plot a single value
plot(kansas07[4,4])

# plot by geography
plot(kansas07[,10])

# plot by columns
plot(kansas07[4,3:10])

# a density plot for a single variable
plot(kansas07[7,10])

# same, using some graphical parameters
plot(kansas07[7,10], col="blue", err.col="purple", err.lty=3)

plot(kansas07[7,49], col="lightblue", type="h", x.res=3000,
err.col="purple", err.lty=3, err.lwd=4, conf.level=.99,
main=(paste("Distribution of Females>85 Years in ",
geography(kansas07)[7,1], sep="")),
sub="(99-percent margin of error shown in purple)")

# something more complicated...

plot(kansas07[c(1,3,4),3:25], err.col="purple",
pch=16, err.pch="x", err.cex=1, ylim=c(0,5000),
col=rainbow(23), conf.level=.99,
labels=paste("grp. ",1:23))




