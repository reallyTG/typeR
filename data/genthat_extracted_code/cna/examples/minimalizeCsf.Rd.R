library(cna)


### Name: minimalizeCsf
### Title: Reduce csf by eliminating redundant parts
### Aliases: minimalizeCsf minimalizeCsf.default minimalizeCsf.cna
###   print.minimalizeCsf

### ** Examples

myData <- allCombs(rep(2, 6))-1
minimalizeCsf("(f + a*D <-> C)*(C + A*B <-> D)*(c + a*E <-> F)", 
              myData)
minimalizeCsf("(f + a*D <-> C)*(C + A*B <-> D)*(c + a*E <-> F)", 
              myData, verbose = TRUE) # Same result, but with some messages.

# cna method.
dat1 <- selectCases("(C + A*B <-> D)*(c + a*E <-> F)", myData)
ana1 <- cna(dat1, details = c("r"))
csf(ana1)
# The attribute "redundant" taking the value TRUE in ana1 shows that this csf contains 
# at least one redundant element. Only the application of minimalizeCsf() identifies 
# the redundant element.
minimalizeCsf(ana1)
## No test: 
# Real data entailing a large number of csf with many redundancies.
tt.js <- fstt(d.jobsecurity)
cna.js <- cna(tt.js, con = .8, cov = .8)
minim100 <- minimalizeCsf(cna.js, n = 100) # may take a couple of seconds...
minim100  # By default the first 5 solutions are displayed. 
## End(No test)
# With mv data.
tt.pban <- mvtt(d.pban)
cna.pban <- cna(tt.pban, con = .75, cov = .75)
csf.pban <- csf(cna.pban, 100)
sol.pban <- csf.pban$condition

minim.pban <- minimalizeCsf(sol.pban, tt.pban)
minim.pban

# Alternatively, a more direct replication of the above using the method of 
# minimalizeCsf for class cna.
minim.pban <- minimalizeCsf(cna.pban, n = 100)
print(minim.pban, 1:50) # print the first 50 redundancy-free csf



