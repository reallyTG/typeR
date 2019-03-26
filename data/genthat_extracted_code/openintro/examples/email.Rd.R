library(openintro)


### Name: email
### Title: Data frame representing information about a collection of emails
### Aliases: email email_test
### Keywords: datasets

### ** Examples

data(email)
e <- email

#______ Variables For Logistic Regression ______#
# Variables are modified to match
#   OpenIntro Statistics, Second Edition
# As Is (7): spam, to_multiple, winner, format,
#            re_subj, exclaim_subj
# Omitted (6): from, sent_email, time, image,
#              viagra, urgent_subj, number
# Become Indicators (5): cc, attach, dollar,
#                        inherit, password
e$cc       <- ifelse(email$cc > 0, 1, 0)
e$attach   <- ifelse(email$attach > 0, 1, 0)
e$dollar   <- ifelse(email$dollar > 0, 1, 0)
e$inherit  <- ifelse(email$inherit > 0, 1, 0)
e$password <- ifelse(email$password > 0, 1, 0)
# Transform (3): num_char, line_breaks, exclaim_mess
#e$num_char     <- cut(email$num_char, c(0,1,5,10,20,1000))
#e$line_breaks  <- cut(email$line_breaks, c(0,10,100,500,10000))
#e$exclaim_mess <- cut(email$exclaim_mess, c(-1,0,1,5,10000))
g <- glm(spam ~ to_multiple + winner + format + 
                re_subj + exclaim_subj +
                cc + attach + dollar +
                inherit + password, # +
                #num_char + line_breaks + exclaim_mess,
                data=e, family=binomial)
summary(g)


#______ Variable Selection Via AIC ______#
g. <- step(g)
plot(predict(g., type="response"), e$spam)


#______ Splitting num_char by html ______#
x   <- log(email$num_char)
bw  <- 0.004
R   <- range(x) + c(-1, 1)
wt  <- sum(email$format)/nrow(email)
htmlAll   <- density(x, bw=0.4, from=R[1], to=R[2])
htmlNo    <- density(x[email$format != 1], bw=0.4,
                     from=R[1], to=R[2])
htmlYes   <- density(x[email$format == 1], bw=0.4,
                     from=R[1], to=R[2])
htmlNo$y  <- htmlNo$y #* (1-wt)
htmlYes$y <- htmlYes$y #* wt + htmlNo$y
plot(htmlAll, xlim=c(-4, 6), ylim=c(0, 0.4))
lines(htmlNo, col=4)
lines(htmlYes, lwd=2, col=2)



