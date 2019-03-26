library(MOTE)


### Name: d.ind.t.t
### Title: d from t for Between Subjects
### Aliases: d.ind.t.t
### Keywords: effect independent size, t

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

    hyp = t.test(correctq ~ group, data = indt_data)

#You can type in the numbers directly, or refer to the dataset,
#as shown below.

    d.ind.t.t(t = -2.6599, n1 = 4, n2 = 4, a = .05)

    d.ind.t.t(-2.6599, 4, 4, .05)

    d.ind.t.t(hyp$statistic,
              length(indt_data$group[indt_data$group == 1]),
              length(indt_data$group[indt_data$group == 2]),
              .05)

#Contrary to the hypothesized result, the group that underwent hypnosis were
#significantly less accurate while reporting facts than the control group
#with a large effect size, t(6) = -2.66, p = .038, d_s = 2.17.




