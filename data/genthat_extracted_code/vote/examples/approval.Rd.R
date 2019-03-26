library(vote)


### Name: approval
### Title: Approval and Plurality Vote Count
### Aliases: approval summary.vote.approval view.vote.approval
###   print.summary.vote.approval vote.approval plurality
###   summary.vote.plurality view.vote.plurality
###   print.summary.vote.plurality vote.plurality
### Keywords: tools

### ** Examples

# Example using the IMS Council dataset modified for approval voting
data(ims_approval)
approval(ims_approval)

# Example using the IMS Council dataset modified for plurality voting
data(ims_plurality)
pl.ims <- plurality(ims_plurality)
invalid.votes(pl.ims)



