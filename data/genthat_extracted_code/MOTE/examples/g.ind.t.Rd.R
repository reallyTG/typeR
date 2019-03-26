library(MOTE)


### Name: g.ind.t
### Title: d-g Corrected for Independent t
### Aliases: g.ind.t
### Keywords: correction effect independent size, t,

### ** Examples


#The following example is derived from the "indt_data" dataset, included
#in the MOTE library.

#A forensic psychologist conducted a study to examine whether
#being hypnotized during recall affects how well a witness
#can remember facts about an event. Eight participants
#watched a short film of a mock robbery, after which
#each participant was questioned about what he or she had
#seen. The four participants in the experimental group
#were questioned while they were hypnotized. The four
#participants in the control group recieved the same
#questioning without hypnosis.

    t.test(correctq ~ group, data = indt_data)

#You can type in the numbers directly, or refer to the dataset,
#as shown below.

    g.ind.t(m1 = 17.75, m2 = 23, sd1 = 3.30,
           sd2 = 2.16, n1 = 4, n2 = 4, a = .05)

    g.ind.t(17.75, 23, 3.30, 2.16, 4, 4, .05)

    g.ind.t(mean(indt_data$correctq[indt_data$group == 1]),
            mean(indt_data$correctq[indt_data$group == 2]),
            sd(indt_data$correctq[indt_data$group == 1]),
            sd(indt_data$correctq[indt_data$group == 2]),
            length(indt_data$correctq[indt_data$group == 1]),
            length(indt_data$correctq[indt_data$group == 2]),
            .05)

#Contrary to the hypothesized result, the group that underwent hypnosis were
#significantly less accurate while reporting facts than the control group
#with a large effect size, t(6) = -2.66, p = .038, d_g = 1.64.




