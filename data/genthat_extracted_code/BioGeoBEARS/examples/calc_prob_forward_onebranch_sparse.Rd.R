library(BioGeoBEARS)


### Name: calc_prob_forward_onebranch_sparse
### Title: Sparse matrix exponentiation forward on a branch, with rexpokit
### Aliases: calc_prob_forward_onebranch_sparse

### ** Examples

# Make a square instantaneous rate matrix (Q matrix)
# This matrix is taken from Peter Foster's (2001) "The Idiot's Guide
# to the Zen of Likelihood in a Nutshell in Seven Days for Dummies,
# Unleashed" at:
# \url{http://www.bioinf.org/molsys/data/idiots.pdf}
#
# The Q matrix includes the stationary base freqencies, which Pmat
# converges to as t becomes large.
require("rexpokit")

Qmat = matrix(c(-1.218, 0.504, 0.336, 0.378, 0.126, -0.882, 0.252, 0.504,
0.168, 0.504, -1.05, 0.378, 0.126, 0.672, 0.252, -1.05), nrow=4, byrow=TRUE)
tmpQmat_in_REXPOKIT_coo_fmt = mat2coo(Qmat)

relprobs_branch_bottom = c(0.25, 0.25, 0.25, 0.25)

# Make a series of t values
branch_length = 0.1

calc_prob_forward_onebranch_sparse(relprobs_branch_bottom, branch_length,
tmpQmat_in_REXPOKIT_coo_fmt, coo_n=4, anorm=1, check_for_0_rows=TRUE,
TRANSPOSE_because_forward=TRUE)
calc_prob_forward_onebranch_sparse(relprobs_branch_bottom, branch_length=0.5,
tmpQmat_in_REXPOKIT_coo_fmt, coo_n=4, anorm=1, check_for_0_rows=TRUE,
TRANSPOSE_because_forward=TRUE)
calc_prob_forward_onebranch_sparse(relprobs_branch_bottom, branch_length=1,
tmpQmat_in_REXPOKIT_coo_fmt, coo_n=4, anorm=1, check_for_0_rows=TRUE,
TRANSPOSE_because_forward=TRUE)
calc_prob_forward_onebranch_sparse(relprobs_branch_bottom, branch_length=2,
tmpQmat_in_REXPOKIT_coo_fmt, coo_n=4, anorm=1, check_for_0_rows=TRUE,
TRANSPOSE_because_forward=TRUE)
calc_prob_forward_onebranch_sparse(relprobs_branch_bottom, branch_length=10,
tmpQmat_in_REXPOKIT_coo_fmt, coo_n=4, anorm=1, check_for_0_rows=TRUE,
TRANSPOSE_because_forward=TRUE)
calc_prob_forward_onebranch_sparse(relprobs_branch_bottom, branch_length=20,
tmpQmat_in_REXPOKIT_coo_fmt, coo_n=4, anorm=1, check_for_0_rows=TRUE,
TRANSPOSE_because_forward=TRUE)



