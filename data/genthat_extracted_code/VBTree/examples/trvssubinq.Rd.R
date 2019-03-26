library(VBTree)


### Name: trvssubinq
### Title: Using sub vector binary tree to visit the traversal table
### Aliases: trvssubinq
### Keywords: Trav.Inq Trav.Table Vector.Binary.Tree

### ** Examples

#Make original vector binary tree and its traversal table:
vbt <- dl2vbt(chrvec2dl(colnames(datatest)))
trav <- trvs(vbt)

#Visit all elements defined by sub vector binary tree:
#example 1: visit all "Stress-*-*-*" patterns;
#make sub vector binary tree through vbtsub() then execute inquiry:
subvbt <- vbtsub(vbt, c(2,-1,-1,-1))
trvssubinq(trav, subvbt)

#example 2: visit all "Strain-("950", "1050")-("0.001", "0.1")-*" patterns;
#make sub vector binary tree through advbtsub() then execute inquiry:
subvbt <- advbtsub(vbt, list(1, c(2,4), c(1,3), 1))
trvssubinq(trav, subvbt)



