library(BioGeoBEARS)


### Name: calc_prob_forward_onebranch_dense
### Title: Dense matrix exponentiation forward on a branch, with rexpokit
### Aliases: calc_prob_forward_onebranch_dense

### ** Examples

# Make a square instantaneous rate matrix (Q matrix)
# This matrix is taken from Peter Foster's (2001) "The Idiot's Guide
# to the Zen of Likelihood in a Nutshell in Seven Days for Dummies,
# Unleashed" at:
# \url{http://www.bioinf.org/molsys/data/idiots.pdf}
#
# The Q matrix includes the stationary base freqencies, which Pmat
# converges to as t becomes large.
Qmat = matrix(c(-1.218, 0.504, 0.336, 0.378, 0.126, -0.882, 0.252, 0.504, 0.168,
0.504, -1.05, 0.378, 0.126, 0.672, 0.252, -1.05), nrow=4, byrow=TRUE)

relprobs_branch_bottom = c(0.25, 0.25, 0.25, 0.25)

# Make a series of t values
branch_length = 0.1

calc_prob_forward_onebranch_dense(relprobs_branch_bottom, branch_length, Qmat)
calc_prob_forward_onebranch_dense(relprobs_branch_bottom, branch_length=0.5, Qmat)
calc_prob_forward_onebranch_dense(relprobs_branch_bottom, branch_length=1, Qmat)
calc_prob_forward_onebranch_dense(relprobs_branch_bottom, branch_length=2, Qmat)
calc_prob_forward_onebranch_dense(relprobs_branch_bottom, branch_length=10, Qmat)
calc_prob_forward_onebranch_dense(relprobs_branch_bottom, branch_length=20, Qmat)



