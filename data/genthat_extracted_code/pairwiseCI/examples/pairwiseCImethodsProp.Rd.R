library(pairwiseCI)


### Name: pairwiseCImethodsProp
### Title: Confidence intervals for two sample comparisons of binomial
###   proportions
### Aliases: pairwiseCImethodsProp Prop.diff Prop.ratio Prop.or
### Keywords: htest

### ** Examples


# The rooting data.

data(rooting)

# the first comparison should be the same as:

Age5_PosB_IBA0 <- subset(rooting,
 Age=="5" & Position=="B" & IBA=="0")[,c("root", "noroot")]
Age5_PosB_IBA0.5 <- subset(rooting,
 Age=="5" & Position=="B" & IBA=="0.5")[,c("root", "noroot")]

Age5_PosB_IBA0
Age5_PosB_IBA0.5

Prop.diff(x=Age5_PosB_IBA0, y=Age5_PosB_IBA0.5)

Prop.ratio(x=Age5_PosB_IBA0, y=Age5_PosB_IBA0.5)

Prop.or(x=Age5_PosB_IBA0, y=Age5_PosB_IBA0.5)

# is the same as input two vectors x,y each containing
# the count of successes and the count of failures

 colSums(Age5_PosB_IBA0)
 colSums(Age5_PosB_IBA0.5)

Prop.diff(x=c(16,32),y=c(29,19))

Prop.ratio(x=c(16,32),y=c(29,19))

Prop.or(x=c(16,32),y=c(29,19))

# # # 

# Comparison with original publications:

# I. Risk difference:

# Continuity corrected interval:

# 1.Comparison with results presented in Newcombe (1998),
# Table II, page 877, 10. Score, CC
# column 1 (a): 56/70-48/80: [0.0441; 0.3559]

Prop.diff(x=c(56,70-56),y=c(48,80-48), alternative="two.sided",
 conf.level=0.95, CImethod="CC")


# Risk difference, NHS
# Newcombes Hybrid Score interval:

# 1.Comparison with results presented in Newcombe (1998),
# Table II, page 877, 10. Score, noCC
# column 1 (a): 56/70-48/80: [0.0524; 0.3339]


Prop.diff(x=c(56,70-56),y=c(48,80-48), alternative="two.sided",
 conf.level=0.95, CImethod="NHS")

Prop.diff(x=c(56,70-56),y=c(48,80-48), alternative="greater",
 conf.level=0.975, CImethod="NHS")

Prop.diff(x=c(56,70-56),y=c(48,80-48), alternative="less",
 conf.level=0.975, CImethod="NHS")


# 2.Comparison with results presented in Newcombe (1998),
# Table II, page 877, 10. Score, noCC
# column 2 (b): 9/10-3/10: [0.1705; 0.8090]

Prop.diff(x=c(9,1),y=c(3,7), alternative="two.sided",
 conf.level=0.95, CImethod="NHS")


# 3.Comparison with results presented in Newcombe (1998),
# Table II, page 877, 10. Score, noCC
# column 2 (h): 10/10-0/10: [0.6075; 1.000]

Prop.diff(x=c(10,0),y=c(0,10), alternative="two.sided",
 conf.level=0.95, CImethod="NHS")


# II. Risk ratio,
# Score interval according to Koopman(1984), Gart and Nam (1988)

# 1.Comparison with results presented in Gart and Nam (1998),
# Section 5 (page 327), Example 1
# x1/n1=8/15 x0/n0=4/15:
# Log: [0.768, 4.65]
# Score: [0.815; 5.34]

# Log (GNC)
Prop.ratio(x=c(8,7),y=c(4,11), alternative="two.sided",
 conf.level=0.95, CImethod="GNC")

# Score (Score)
Prop.ratio(x=c(8,7),y=c(4,11), alternative="two.sided",
 conf.level=0.95, CImethod="Score")

Prop.ratio(x=c(8,7),y=c(4,11), alternative="less",
 conf.level=0.975, CImethod="Score")

Prop.ratio(x=c(8,7),y=c(4,11), alternative="greater",
 conf.level=0.975, CImethod="Score")



# 2.Comparison with results presented in Gart and Nam (1998),
# Section 5 (page 328), Example 2
# x1/n1=6/10 x0/n0=6/20:
# Crude Log: [0.883, 4.32]
# Score: [0.844; 4.59]

Prop.ratio(x=c(6,4),y=c(6,14), alternative="two.sided",
 conf.level=0.95, CImethod="GNC")

Prop.ratio(x=c(6,4),y=c(6,14), alternative="two.sided",
 conf.level=0.95, CImethod="Score")


# Koopman (1984), page 517
# x1=36, n1=40, x0=16, n0=80: [2.94, 7.15]

Prop.ratio(x=c(36, 4), y=c(16, 64), CImethod="Score")$conf.int 


# Miettinen, Nurminen (1985) p. 217 (Example 6): 
# x1=10, n1=10, x0=20, n0=20: [0.72, 1.20]

Prop.ratio(x=c(10, 0), y=c(20, 0), CImethod="MNScore")$conf.int


# MOVER-R Wilson in Newcombe and Fagerland, 2013, Table VIII:
#  x1=24, n1=73,x0=53, n0=65: [0.282, 0.563]
Prop.ratio(x=c(24, 49), y=c(53, 12), CImethod="MOVER")$conf.int 

#  x1=29, n1=55, x0=11, n0=11: [0.398, 0.761]
Prop.ratio(x=c(29, 26), y=c(11,0), CImethod="MOVER")$conf.int 

#  x1=7, n1=18, x0=1, n0=18: [(1.27, 40.8)]
Prop.ratio(x=c(7, 11), y=c(1, 17), CImethod="MOVER")$conf.int 


 


