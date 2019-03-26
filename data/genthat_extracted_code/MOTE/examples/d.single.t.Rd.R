library(MOTE)


### Name: d.single.t
### Title: d for Single t from Means
### Aliases: d.single.t
### Keywords: effect mean mean, mu, population sample single single-sample,
###   size, t, u,

### ** Examples


#The following example is derived from the "singt_data" dataset included
#in the MOTE library.

#A school has a gifted/honors program that they claim is
#significantly better than others in the country. The gifted/honors
#students in this school scored an average of 1370 on the SAT,
#with a standard deviation of 112.7, while the national average
#for gifted programs is a SAT score of 1080.

    gift = t.test(singt_data, mu = 1080, alternative = "two.sided")

#You can type in the numbers directly as shown below,
#or refer to your dataset within the function.

    d.single.t(m = 1370, u = 1080, sd = 112.7, n = 14, a = .05)

    d.single.t(1370, 1080, 112.7, 100, .05)

    d.single.t(gift$estimate, gift$null.value,
            sd(singt_data$SATscore),
        length(singt_data$SATscore), .05)



