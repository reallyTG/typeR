## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(comment = "#>")

## ---- echo=FALSE, collapse=TRUE,comment=""-------------------------------
cat("     |   |            |  {5}\n     o   o            o   o\n     |   |     =>    {1} {3}\n     .   .           {2} {4}\n    /|\\ /|\\          /|\\ /|\\")


## ---- results='hide', warning=FALSE--------------------------------------
alphabet <- 8      # the number of colors we have
total.length <- 5  # the number of positions we want band
redundancy <- 2    # how many bands we can lose but still ID perfectly
codes <- rabi::reed_solomon(total.length, redundancy, alphabet)
print(paste0("Our list contains ", length(codes), " unique IDs."))
head(codes, n = 10L)

## ---- results='hide',echo=FALSE, comment="!!"----------------------------
codes <- rabi::reed_solomon(total.length, redundancy, alphabet)

## ---- echo=FALSE---------------------------------------------------------
print(paste0("Our list contains ", length(codes), " unique IDs."))
codes <- t(do.call("cbind",codes))
knitr::kable(head(codes, n = 10L), col.names = c("{1}","{2}","{3}","{4}","{5}"), align = "c", caption = "ID sequences in the unaltered list")

## ---- echo=FALSE, collapse=TRUE,comment=""-------------------------------
cat("     |  {5}           |  {5}           |  {5}\n     o   o            o   o            o   o\n    {1} {3}   AND     x  {3}    =>     |  {3}\n     x  {4}          {2} {4}          {?} {4}\n    /|\\ /|\\          /|\\ /|\\          /|\\ /|\\")


## ---- results='hide',echo=FALSE, messages=FALSE, warning=FALSE-----------
codes <- rabi::reed_solomon(total.length = 5, redundancy = 2, alphabet = 8)

## ------------------------------------------------------------------------
 #create a function for determining odd or even
odd <- function(x){ x %% 2 == 1 }
 #turn the code list into a matrix for easier manipulation
codes <- t(do.call("cbind",codes)) 
 #only select the codes where {1} and {3} are odd, and {2} and {4} are even
codes <- 
  codes[which(odd(codes[,1]) & odd(codes[,3]) & !odd(codes[,2]) & !odd(codes[,4])), ]
print(paste0("Our new list contains ", dim(codes)[1], " unique IDs."))

## ------------------------------------------------------------------------
 #create a matrix of all possible sequences
perms <- rep(list(seq_len(alphabet)),total.length)
combos <- as.matrix(expand.grid(perms)) - 1
 #only keep sequences that fit our constraints
combos1 <- 
  combos[which(odd(combos[,1]) & odd(combos[,3]) & !odd(combos[,2]) & !odd(combos[,4])), ]
codes <- rabi::tweaker(combos1, redundancy, num.tries = 1)  #we're only running it once for speed
print(paste0("The 'tweaked' list contains ", length(codes), " unique IDs."))


## ---- echo=FALSE, collapse=TRUE,comment=""-------------------------------
cat("     |  {5}          {5}  |\n     o   o            o   o\n    {1} {3}    OR    {1} {3}\n    {2} {4}          {2} {4}\n    /|\\ /|\\          /|\\ /|\\")


## ---- results='hide', warning=FALSE--------------------------------------
 #only select sequences where the top and bottom bands differ in "oddness"
combos2 <- combos[which((
      (odd(combos[,1]) & odd(combos[,3]) & !odd(combos[,2]) & !odd(combos[,4])) |
      (!odd(combos[,1]) & !odd(combos[,3]) & odd(combos[,2]) & odd(combos[,4]))
      )), ]
codes <- rabi::tweaker(combos2, redundancy, num.tries = 1)  #we're only running it once for speed
 #add either a "left" or "right" indicating which leg {5} is on
codes <- lapply(codes, function(x) if(odd(x[[1]])) {append(x,"R")} else {append(x,"L")})
print(paste0("The 'tweaked' list contains ", length(codes), " unique IDs."))
head(codes, n = 10L)


## ---- echo=FALSE---------------------------------------------------------
print(paste0("The 'tweaked' list contains ", length(codes), " unique IDs."))
codes <- t(do.call("cbind",codes))
knitr::kable(head(codes, n = 10L), col.names = c("{1}","{2}","{3}","{4}","{5}","{5}'s Position"), align = "c", caption = "ID sequences in variable position list")

## ---- echo=FALSE, collapse=TRUE,comment=""-------------------------------
cat("     |  {5}          {1} {5}\n     o   o            o   o\n    {1} {3}    =>     |  {3}\n    {2} {4}          {2} {4}\n    /|\\ /|\\          /|\\ /|\\")


## ------------------------------------------------------------------------
 #now, only {3} and {4} need to be constrained as odd and even, respectively
combos3 <- 
  combos[which(odd(combos[,3]) & !odd(combos[,4])), ]
codes <- rabi::tweaker(combos3, redundancy, num.tries = 1)  #we're only running it once for speed
print(paste0("This last list contains ", length(codes), " unique IDs."))


