library(mirtCAT)


### Name: mirtCAT
### Title: Generate an adaptive or non-adaptive test HTML interface
### Aliases: mirtCAT print.mirtCAT summary.mirtCAT plot.mirtCAT
### Keywords: CAT, MCAT, adaptive computerized testing

### ** Examples

## Not run: 
##D 
##D ### unidimensional scored example with generated items
##D 
##D # create mo from estimated parameters
##D set.seed(1234)
##D nitems <- 50
##D itemnames <- paste0('Item.', 1:nitems)
##D a <- matrix(rlnorm(nitems, .2, .3))
##D d <- matrix(rnorm(nitems))
##D dat <- simdata(a, d, 1000, itemtype = 'dich')
##D mod <- mirt(dat, 1)
##D coef(mod, simplify=TRUE)
##D 
##D # alternatively, define mo from population values (not run)
##D pars <- data.frame(a1=a, d=d)
##D mod2 <- generate.mirt_object(pars, itemtype='2PL')
##D coef(mod2, simplify=TRUE)
##D 
##D # simple math items
##D questions <- answers <- character(nitems)
##D choices <- matrix(NA, nitems, 5)
##D spacing <- floor(d - min(d)) + 1 #easier items have more variation in the options
##D 
##D for(i in 1:nitems){
##D     n1 <- sample(1:50, 1)
##D     n2 <- sample(51:100, 1)
##D     ans <- n1 + n2
##D     questions[i] <- paste0(n1, ' + ', n2, ' = ?')
##D     answers[i] <- as.character(ans)
##D     ch <- ans + sample(c(-5:-1, 1:5) * spacing[i,], 5)
##D     ch[sample(1:5, 1)] <- ans
##D     choices[i, ] <- as.character(ch)
##D }
##D 
##D df <- data.frame(Question=questions, Option=choices, 
##D                               Type = 'radio', stringsAsFactors = FALSE)
##D head(df)
##D 
##D (res <- mirtCAT(df)) #collect response only (no scoring or estimating thetas)
##D summary(res)
##D 
##D # include scoring by providing Answer key
##D df$Answer <- answers
##D (res_seq <- mirtCAT(df, mod)) #sequential scoring 
##D (res_random <- mirtCAT(df, mod, criteria = 'random')) #random
##D (res_MI <- mirtCAT(df, mod, criteria = 'MI', start_item = 'MI')) #adaptive, MI starting item
##D 
##D summary(res_seq)
##D summary(res_random)
##D summary(res_MI)
##D 
##D #-----------------------------------------
##D # HTML tags for better customization, coerced to characters for compatability
##D 
##D # help(tags, package='shiny')
##D options <- matrix(c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"),
##D                   nrow = 3, ncol = 5, byrow = TRUE)
##D shinyStems <- list(HTML('Building CATs with mirtCAT is difficult.'),
##D                div(HTML('mirtCAT requires a'), br(), HTML('substantial amount of coding.')),
##D                div(strong('I would use'), HTML('mirtCAT in my research.')))
##D questions <- sapply(shinyStems, as.character)
##D df <- data.frame(Question=questions,
##D                  Option = options, 
##D                  Type = "radio",
##D                  stringsAsFactors=FALSE)
##D 
##D res <- mirtCAT(df)
##D res
##D 
##D #-----------------------------------------
##D 
##D # run locally, random response pattern given Theta
##D set.seed(1)
##D pat <- generate_pattern(mod, Theta = 0, df=df)
##D head(pat)
##D 
##D # seq scoring with character pattern for the entire test (adjust min_items)
##D res <- mirtCAT(df, mod, local_pattern=pat, design = list(min_items = 50)) 
##D summary(res)
##D 
##D # same as above, but using special input vector that doesn't require df input
##D set.seed(1)
##D pat2 <- generate_pattern(mod, Theta = 0)
##D head(pat2)
##D print(mirtCAT(mo=mod, local_pattern=pat2))
##D 
##D # run CAT, and save results to object called person (start at 10th item)
##D person <- mirtCAT(df, mod, item_answers = answers, criteria = 'MI', 
##D                   start_item = 10, local_pattern = pat)
##D print(person)
##D summary(person)
##D 
##D # plot the session
##D plot(person) #standard errors
##D plot(person, SE=1.96) #95 percent confidence intervals
##D 
##D #-----------------------------------------
##D 
##D ### save response object to temp directory in case session ends early
##D wdf <- paste0(getwd(), '/temp_file.rds')
##D res <- mirtCAT(df, mod, shinyGUI = list(temp_file = wdf))
##D 
##D # resume test this way if test was stopped early (and temp files were saved)
##D res <- mirtCAT(df, mod, shinyGUI = list(temp_file = wdf))
##D print(res)
##D 
## End(Not run)



