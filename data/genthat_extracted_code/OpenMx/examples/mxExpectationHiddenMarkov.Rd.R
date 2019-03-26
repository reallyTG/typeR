library(OpenMx)


### Name: mxExpectationHiddenMarkov
### Title: Hidden Markov expectation
### Aliases: MxExpectationHiddenMarkov-class mxExpectationHiddenMarkov
###   print,MxExpectationHiddenMarkov-method
###   show,MxExpectationHiddenMarkov-method

### ** Examples

library(OpenMx)

start_prob <- c(.2,.4,.4)
transition_prob <- matrix(c(.8, .1, .1,
			.3, .6, .1,
			.1, .3, .6), 3, 3)
noise <- .5

  # simulate a trajectory
  state <- sample.int(3, 1, prob=transition_prob %*% start_prob)
  trail <- c(state)

  for (rep in 1:500) {
    state <- sample.int(3, 1, prob=transition_prob[,state])
    trail <- c(trail, state)
  }
  
  # add noise
  trailN <- sapply(trail, function(v) rnorm(1, mean=v, sd=sqrt(noise)))

  classes <- list()
  
  for (cl in 1:3) {
    classes[[cl]] <- mxModel(paste0("cl", cl), type="RAM",
                             manifestVars=c("ob"),
                             mxPath("one", "ob", value=cl, free=FALSE),
                             mxPath("ob", arrows=2, value=noise, free=FALSE),
                             mxFitFunctionML(vector=TRUE))
  }

  m1 <-  
    mxModel("hmm", classes,
            mxData(data.frame(ob=trailN), "raw"),
            mxMatrix(nrow=3, ncol=1,
                     labels=paste0('i',1:3), name="initial"),
            mxMatrix(nrow=length(classes), ncol=length(classes),
                     labels=paste0('t', 1:(length(classes) * length(classes))),
                     name="transition"),
            mxExpectationHiddenMarkov(
              components=sapply(classes, function(m) m$name),
              initial="initial",
              transition="transition", scale="softmax"),
            mxFitFunctionML())

  m1$transition$free[1:(length(classes)-1), 1:length(classes)] <- TRUE

m1 <- mxRun(m1)

summary(m1)

print(m1$expectation$output)



