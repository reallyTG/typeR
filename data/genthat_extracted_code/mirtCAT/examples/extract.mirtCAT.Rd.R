library(mirtCAT)


### Name: extract.mirtCAT
### Title: Extract elements from the internal person, test, and design
###   objects
### Aliases: extract.mirtCAT

### ** Examples


## Not run: 
##D  #example test
##D set.seed(1234)
##D nitems <- 25
##D itemnames <- paste0('Item.', 1:nitems)
##D a <- matrix(rlnorm(nitems, .2, .3))
##D d <- matrix(rnorm(nitems))
##D dat <- simdata(a, d, 500, itemtype = 'dich')
##D colnames(dat) <- itemnames
##D mod <- mirt(dat, 1, verbose = FALSE, TOL = .01)
##D 
##D # simple math items
##D questions <- answers <- character(nitems)
##D choices <- matrix(NA, nitems, 5)
##D spacing <- floor(d - min(d)) + 1 #easier items have more variation in the options
##D 
##D for(i in 1:nitems){
##D   n1 <- sample(1:50, 1)
##D   n2 <- sample(51:100, 1)
##D   ans <- n1 + n2
##D   questions[i] <- paste0(n1, ' + ', n2, ' = ?')
##D   answers[i] <- as.character(ans)
##D   ch <- ans + sample(c(-5:-1, 1:5) * spacing[i,], 5)
##D   ch[sample(1:5, 1)] <- ans
##D   choices[i, ] <- as.character(ch)
##D }
##D 
##D df <- data.frame(Question=questions, Option=choices, 
##D   Type = 'radio', stringsAsFactors = FALSE)
##D df$Answer <- answers
##D 
##D pat <- generate_pattern(mod, Theta = 0, df)
##D 
##D #------------------------------------------------
##D # administer items in sequence
##D customNextItem <- function(person, design, test){
##D    # browser()
##D    items_left_2_choose_from <- extract.mirtCAT(person, 'items_in_bank')
##D    min(items_left_2_choose_from)
##D }
##D 
##D res <- mirtCAT(df, local_pattern=pat, 
##D   design = list(customNextItem=customNextItem))
##D summary(res)
##D 
##D #------------------------------------------------
##D # administer items in order, but stop after 10 items
##D customNextItem <- function(person, design, test){
##D    items_left_2_choose_from <- extract.mirtCAT(person, 'items_in_bank')
##D    items_answered <- extract.mirtCAT(person, 'items_answered')
##D    total <- sum(!is.na(items_answered))
##D    ret <- if(total < 10) min(items_left_2_choose_from)
##D      else return(NA)
##D    ret
##D }
##D 
##D res <- mirtCAT(df, local_pattern=pat, 
##D   design = list(customNextItem=customNextItem))
##D summary(res)
##D 
##D #------------------------------------------------
##D # using findNextItem() and stopping after 10 items
##D 
##D customNextItem <- function(person, design, test){
##D    items_answered <- extract.mirtCAT(person, 'items_answered')
##D    total <- sum(!is.na(items_answered))
##D    ret <- NA
##D    if(total < 10) 
##D      ret <- findNextItem(person=person, test=test, design=design, criteria = 'MI')
##D    ret
##D }
##D 
##D res <- mirtCAT(df, mod, local_pattern=pat, start_item = 'MI',
##D   design = list(customNextItem=customNextItem))
##D summary(res)
##D 
##D # equivalent to the following
##D res2 <- mirtCAT(df, mod, local_pattern=pat, start_item = 'MI', 
##D   criteria = 'MI', design = list(max_items = 10))
##D summary(res2)
##D 
## End(Not run)



