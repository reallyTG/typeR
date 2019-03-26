library(IATscores)


### Name: RobustScores
### Title: Compute the Robust IAT scores
### Aliases: RobustScores D2 D5 D6 D2SWND D5SWND D6SWND

### ** Examples

#### generate random IAT data ####
set.seed(1234)
rawIATdata <- data.frame(
  # ID of each participant (N = 10)
  ID = rep(1:10, each = 180), 
  # seven-block structure, as in Greenwald, Nosek & Banaji (2003)
  # block 1 = target discrimination (e.g., Bush vs. Gore items)
  # block 2 = attribute discrimination (e.g., Pleasant words vs. unpleasant)
  # block 3 = combined practice (e.g., Bush + pleasant vs. Gore + unpleasant)
  # block 4 = combined critical  (e.g., Bush + pleasant vs. Gore + unpleasant)
  # block 5 = reversed target discrimination (e.g., Gore vs. Bush)
  # block 6 = reversed combined practice (e.g., Gore + pleasant vs. Bush + unpleasant)
  # block 7 = reversed combined critical (e.g., Gore + pleasant vs. Bush + unpleasant)
  block = rep(c(rep(1:3, each = 20),
                rep(4, 40),
                rep(5:6, each = 20),
                rep(7, 40)), 10),
  # expected proportion of errors = 10 percent
  correct = sample(c(0, 1), size = 1800, replace = TRUE, prob = c(.2, .8)),
  # reaction times are generated from a mix of two chi2 distributions,
  # one centered on 550ms and one on 100ms to simulate fast latencies
  latency = round(sample(c(rchisq(1500, df = 1, ncp = 550),
                           rchisq(300, df = 1, ncp = 100)), 1800)))

# add some IAT effect by making trials longer in block 6 and 7
rawIATdata[rawIATdata$block >= 6, "latency"] <- 
  rawIATdata[rawIATdata$block >= 6, "latency"] + 100
  
# add some more effect for subjects 1 to 5
rawIATdata[rawIATdata$block >= 6 &
             rawIATdata$ID <= 5, "latency"] <- 
  rawIATdata[rawIATdata$block >= 6 &
             rawIATdata$ID <= 5, "latency"] + 100
               
#### pretreat IAT data using function Pretreatment ####
IATdata <- Pretreatment(rawIATdata,
                             label_subject = "ID",
                          label_latency = "latency",
                          label_accuracy = "correct",
                          label_block = "block",
                          block_pair1 = c(3, 4),
                          block_pair2 = c(6, 7),
                          label_praccrit = "block",
                          block_prac = c(3, 6),
                          block_crit = c(4, 7))


#### Compute Greenwald et al.'s (2003, Table 3) D2, D5, and D6 measures ####
# All scores are computed both with the RobustScores and with
# the wrappers D2, D5, and D6. Results are identical

# D2 scores
D2(IATdata, verbose = FALSE)
RobustScores(IATdata = IATdata,
             P1 = "fxtrim",
             P2 = "ignore",
             P3 = "dscore",
             P4 = "dist",
             verbose = FALSE)

# D5 scores
D5(IATdata, verbose = FALSE)
RobustScores(IATdata = IATdata,
             P1 = "fxtrim",
             P2 = "recode",
             P3 = "dscore",
             P4 = "dist",
             verbose = FALSE)

# D6 scores
D6(IATdata, verbose = FALSE)
RobustScores(IATdata = IATdata,
             P1 = "fxtrim",
             P2 = "recode600",
             P3 = "dscore",
             P4 = "dist",
             verbose = FALSE)

#### Compute D scores with improvements by Richetin et al. (2015, p. 20) ####
# "In this perspective, we examined whether the D2 for built-in penalty and the
# D5 and D6 for no built-in penalty could benefit from the inclusion of two
# elements that stand out from the results. Within their respective parameter,
# the Statistical Winsorizing as a treatment for extreme latencies and No 
# distinction between practice and test trials when computing the difference
# between the two critical blocks seem to lead to the best performances". 

# All scores are computed both with the RobustScores and with
# the wrappers D2SWND, D5SWND, and D6SWND. Results are identical


# D2SWND scores
D2SWND(IATdata, verbose = FALSE)
RobustScores(IATdata = IATdata,
             P1 = "wins10",
             P2 = "ignore",
             P3 = "dscore",
             P4 = "nodist",
             verbose = FALSE)

# D5_SWND scores
D5SWND(IATdata, verbose = FALSE)
RobustScores(IATdata = IATdata,
             P1 = "wins10",
             P2 = "recode",
             P3 = "dscore",
             P4 = "nodist",
             verbose = FALSE)

# D6_SWND scores
D6SWND(IATdata, verbose = FALSE)
RobustScores(IATdata = IATdata,
             P1 = "wins10",
             P2 = "recode600",
             P3 = "dscore",
             P4 = "nodist",
             verbose = FALSE)


## No test: 
  #### Compute all 421 combinations of IAT scores ####
  # 421 are the combinations given by parameters P1, P2, P3, and P4. For
  # details, see Richetin et al. (2015)
  allIATscores <- RobustScores(IATdata = IATdata)
## End(No test)



