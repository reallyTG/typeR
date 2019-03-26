library(MOTE)


### Name: d.single.t.t
### Title: d for Single t from t
### Aliases: d.single.t.t
### Keywords: effect single size, t

### ** Examples


#A school has a gifted/honors program that they claim is
#significantly better than others in the country. The gifted/honors
#students in this school scored an average of 1370 on the SAT,
#with a standard deviation of 112.7, while the national average
#for gifted programs is a SAT score of 1080.

    gift = t.test(singt_data, mu = 1080, alternative = "two.sided")

#According to a single-sample t-test, the scores of the students
#from the program were significantly higher than the national
#average, t(14) = 9.97, p < .001.

#You can type in the numbers directly as shown below, or refer
#to your dataset within the function.

    d.single.t.t(t = 9.968, n = 15, a = .05)

    d.single.t.t(9.968, 15, .05)

    d.single.t.t(gift$statistic, length(singt_data$SATscore), .05)



