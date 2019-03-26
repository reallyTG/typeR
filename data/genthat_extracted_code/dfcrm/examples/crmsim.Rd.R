library(dfcrm)


### Name: crmsim
### Title: CRM Simulator
### Aliases: crmsim onetrial mtrials plot.sim print.sim
### Keywords: datasets

### ** Examples

PI <- c(0.10, 0.20, 0.40, 0.50, 0.60, 0.65)
prior <- c(0.05, 0.10, 0.20, 0.35, 0.50, 0.70)
target <- 0.2
x0 <- c(rep(1,3), rep(2,3), rep(3,3), rep(4,3), rep(5,3), rep(6,9))

# Generate a single replicate of two-stage group CRM trial of group size 3
foo <- crmsim(PI, prior, target, 24, x0, mcohort=3)
## Not run: plot(foo,ask=T)  # summarize trial graphically

# Generate 10 replicates of CRM trial with 24 subjects
foo10 <- crmsim(PI, prior, target, 24, 3, nsim=10, mcohort=2)
foo10



