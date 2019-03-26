library(RDS)


### Name: plot.rds.data.frame
### Title: Diagnostic plots for the RDS recruitment process
### Aliases: plot.rds.data.frame

### ** Examples

data(fauxmadrona)
## Not run: 
##D plot(fauxmadrona)
## End(Not run)
plot(fauxmadrona, plot.type='Recruits by wave')
plot(fauxmadrona, plot.type='Recruits per seed')
plot(fauxmadrona, plot.type='Recruits per subject')

plot(fauxmadrona, plot.type='Recruits by wave', stratify.by='disease')
plot(fauxmadrona, plot.type='Recruits per seed', stratify.by='disease')
plot(fauxmadrona, plot.type='Recruits per subject', stratify.by='disease')



