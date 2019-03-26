library(qdap)


### Name: wfm
### Title: Word Frequency Matrix
### Aliases: wfm wfm.wfdf wfm.character wfm.factor wfdf wfm_expanded
###   wfm_combine weight.wfm weight.wfdf as.wfm as.wfm.matrix
###   as.wfm.default as.wfm.TermDocumentMatrix as.wfm.DocumentTermMatrix
###   as.wfm.data.frame as.wfm.wfdf as.wfm.Corpus wfm.Corpus
### Keywords: word-frequency-matrix

### ** Examples

## Not run: 
##D ## word frequency matrix (wfm) example:
##D with(DATA, wfm(state, list(sex, adult)))[1:15, ]
##D with(DATA, wfm(state, person))[1:15, ]
##D Filter(with(DATA, wfm(state, list(sex, adult))), 5)
##D with(DATA, wfm(state, list(sex, adult)))
##D 
##D ## Filter particular words based on max/min values in wfm
##D v <- with(DATA, wfm(state, list(sex, adult)))
##D Filter(v, 5)
##D Filter(v, 5, count.apostrophe = FALSE)
##D Filter(v, 5, 7)
##D Filter(v, 4, 4)
##D Filter(v, 3, 4)
##D Filter(v, 3, 4, stopwords = Top25Words)
##D 
##D ## insert double tilde ("~~") to keep phrases(i.e., first last name)
##D alts <- c(" fun", "I ")
##D state2 <- space_fill(DATA$state, alts, rm.extra = FALSE)
##D with(DATA, wfm(state2, list(sex, adult)))[1:18, ]
##D 
##D ## word frequency dataframe (wfdf) example:
##D with(DATA, wfdf(state, list(sex, adult)))[1:15, ]
##D with(DATA, wfdf(state, person))[1:15, ]
##D 
##D ## wfm_expanded example:
##D z <- wfm(DATA$state, DATA$person)
##D wfm_expanded(z)[30:45, ] #two "you"s
##D 
##D ## wf_combine examples:
##D #===================
##D ## raw no margins (will work) 
##D x <- wfm(DATA$state, DATA$person) 
##D                     
##D ## raw with margin (will work) 
##D y <- wfdf(DATA$state, DATA$person, margins = TRUE) 
##D 
##D ## Proportion matrix
##D z2 <- wfm(DATA$state, DATA$person, output="proportion")
##D 
##D WL1 <- c(y[, 1])                                                                      
##D WL2 <- list(c("read", "the", "a"), c("you", "your", "you're"))                       
##D WL3 <- list(bob = c("read", "the", "a"), yous = c("you", "your", "you're"))          
##D WL4 <- list(bob = c("read", "the", "a"), yous = c("a", "you", "your", "your're"))     
##D WL5 <- list(yous = c("you", "your", "your're"))                                       
##D WL6 <- list(c("you", "your", "your're"))  #no name so will be called words 1          
##D WL7 <- c("you", "your", "your're")                             
##D                                                                
##D wfm_combine(z2, WL2) #Won't work not a raw frequency matrix     
##D wfm_combine(x, WL2)  #Works (raw and no margins)                     
##D wfm_combine(y, WL2)  #Works (raw with margins)                           
##D wfm_combine(y, c("you", "your", "your're"))                        
##D wfm_combine(y, WL1)                                                  
##D wfm_combine(y, WL3)                                                   
##D ## wfm_combine(y, WL4) #Error         
##D wfm_combine(y, WL5)                                         
##D wfm_combine(y, WL6)                                              
##D wfm_combine(y, WL7)                                           
##D                                                                   
##D worlis <- c("you", "it", "it's", "no", "not", "we")              
##D y <- wfdf(DATA$state, list(DATA$sex, DATA$adult), margins = TRUE)  
##D z <- wfm_combine(y, worlis)                      
##D                                                                  
##D chisq.test(z)                                                      
##D chisq.test(wfm(y)) 
##D 
##D ## Dendrogram
##D presdeb <- with(pres_debates2012, wfm(dialogue, list(person, time)))
##D library(sjPlot)
##D sjc.dend(t(presdeb), 2:4)
##D 
##D ## Words correlated within turns of talk
##D ## EXAMPLE 1
##D library(reports)
##D x <- factor(with(rajSPLIT, paste(act, pad(TOT(tot)), sep = "|")))
##D dat <- wfm(rajSPLIT$dialogue, x)
##D 
##D cor(t(dat)[, c("romeo", "juliet")])
##D cor(t(dat)[, c("romeo", "banished")])
##D cor(t(dat)[, c("romeo", "juliet", "hate", "love")])
##D qheat(cor(t(dat)[, c("romeo", "juliet", "hate", "love")]), 
##D     diag.na = TRUE, values = TRUE, digits = 3, by.column = NULL)
##D     
##D dat2 <- wfm(DATA$state, id(DATA))
##D qheat(cor(t(dat2)), low = "yellow", high = "red", 
##D     grid = "grey90", diag.na = TRUE, by.column = NULL)
##D     
##D ## EXAMPLE 2
##D x2 <- factor(with(pres_debates2012, paste(time, pad(TOT(tot)), sep = "|")))
##D dat2 <- wfm(pres_debates2012$dialogue, x2)
##D wrds <- word_list(pres_debates2012$dialogue, 
##D     stopwords = c("it's", "that's", Top200Words))
##D wrds2 <- tolower(sort(wrds$rfswl[[1]][, 1]))
##D qheat(word_cor(t(dat2), word = wrds2, r = NULL),
##D     diag.na = TRUE, values = TRUE, digits = 3, by.column = NULL, 
##D     high="red", low="yellow", grid=NULL)
##D     
##D ## EXAMPLE 3
##D library(gridExtra); library(ggplot2); library(grid)
##D dat3 <- lapply(qcv(OBAMA, ROMNEY), function(x) {
##D     with(pres_debates2012, wfm(dialogue[person == x], x2[person == x]))
##D })
##D 
##D 
##D # Presidential debates by person
##D dat5 <- pres_debates2012
##D dat5 <- dat5[dat5$person %in% qcv(ROMNEY, OBAMA), ]
##D 
##D disp <- with(dat5, dispersion_plot(dialogue, wrds2, grouping.var = person, 
##D     total.color = NULL, rm.vars=time))
##D 
##D 
##D cors <- lapply(dat3, function(m) {
##D     word_cor(t(m), word = wrds2, r = NULL)
##D })
##D 
##D plots <- lapply(cors, function(x) {
##D     qheat(x, diag.na = TRUE, values = TRUE, digits = 3, plot = FALSE,
##D     by.column = NULL, high="red", low="yellow", grid=NULL)
##D })
##D 
##D plots <- lapply(1:2, function(i) {
##D     plots[[i]] + ggtitle(qcv(OBAMA, ROMNEY)[i]) +
##D     theme(axis.title.x = element_blank(),
##D         plot.margin = unit(rep(0, 4), "lines"))
##D })
##D 
##D grid.arrange(disp, arrangeGrob(plots[[1]], plots[[2]], ncol=1), ncol=2)
##D 
##D ## With `word_cor`
##D worlis <- list(
##D     pronouns = c("you", "it", "it's", "we", "i'm", "i"),
##D     negative = qcv(no, dumb, distrust, not, stinks),
##D     literacy = qcv(computer, talking, telling)
##D )
##D y <- wfdf(DATA$state, qdapTools::id(DATA, prefix = TRUE))
##D z <- wfm_combine(y, worlis)
##D 
##D word_cor(t(z), word = names(worlis), r = NULL)
##D 
##D ## Plotting method
##D plot(y, TRUE)
##D plot(z)
##D 
##D ## Correspondence Analysis
##D library(ca)
##D 
##D dat <- pres_debates2012
##D dat <- dat[dat$person %in% qcv(ROMNEY, OBAMA), ]
##D 
##D speech <- stemmer(dat$dialogue)
##D mytable1 <- with(dat, wfm(speech, list(person, time), stopwords = Top25Words))
##D 
##D fit <- ca(mytable1)
##D summary(fit)
##D plot(fit)
##D plot3d.ca(fit, labels=1)
##D 
##D 
##D mytable2 <- with(dat, wfm(speech, list(person, time), stopwords = Top200Words))
##D 
##D fit2 <- ca(mytable2)
##D summary(fit2)
##D plot(fit2)
##D plot3d.ca(fit2, labels=1)
##D 
##D ## Weight a wfm
##D WFM <- with(DATA, wfm(state, list(sex, adult)))
##D plot(weight(WFM, "scaled"), TRUE)
##D weight(WFM, "prop")
##D weight(WFM, "max")
##D weight(WFM, "scaled")
## End(Not run)



