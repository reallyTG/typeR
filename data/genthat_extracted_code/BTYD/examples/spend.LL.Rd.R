library(BTYD)


### Name: spend.LL
### Title: Spend Log-Likelihood
### Aliases: spend.LL

### ** Examples

data(cdnowSummary)
ave.spend <- cdnowSummary$m.x;
tot.trans <- cdnowSummary$cbs[,"x"];
params <- c(6.25, 3.74, 15.44);

# get the total log-likelihood of the data and parameters
# above. There will be many warnings due to the zeroes that are
# included in the data. If you wish to avoid these warnings, use:

# ave.spend <- ave.spend[which(tot.trans > 0)];
# and
# tot.trans <- tot.trans[which(tot.trans > 0)];

# Note that we used tot.trans to remove the zeroes from ave.spend.
# This is because we need the vectors to be the same length, and it
# is possible that your data include customers who made transactions
# worth zero dollars (in which case the vector lengths would differ
# if we used ave.spend to remove the zeroes from ave.spend).

sum(spend.LL(params, ave.spend, tot.trans))

# This log-likelihood may be different than mentioned in the
# referenced paper; in the paper, a slightly different function
# which relies on total spend (not average spend) is used.



