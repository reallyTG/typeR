library(elec)


### Name: yolo
### Title: Yolo County, CA Election Data
### Aliases: yolo
### Keywords: datasets

### ** Examples

# Make an elec.data object out of precicnt-level results
data(yolo)
yolo = make.Z( yolo, C.names=c("y","n","under","over"), tot.votes.col="b" ) 

# Look at different sample sizes and cuts for setting aside
# small precincts
CAST.calc.opt.cut( yolo, beta=0.75, stages=1, t=5, plot=TRUE )

print( yolo )

# Get details of the audit plan -- expected work, etc.
ap <- CAST.calc.sample( yolo, beta=0.75, stages=1, t=5, small.cut=5 )
print( ap )

# Draw a sample (seed not used for actual audit)
CAST.sample(yolo, ap, seed=12345678)





