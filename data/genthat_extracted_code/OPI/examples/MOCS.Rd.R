library(OPI)


### Name: MOCS
### Title: Method of Constant Stimuli (MOCS)
### Aliases: MOCS
### Keywords: methods

### ** Examples

    # Return a list of opi stim objects (list of class opiStaticStimulus)
    # for each level (dB) in p[5:length(p)]. Each stim has responseWindow
    # BETWEEN_FLASH_TIME, except the last which has rwin.
    # This one assumes p is on old Octopus 900 dB scale (0dB == 4000 cd/m^2).
makeStim <- function(p, rwin) {
    BETWEEN_FLASH_TIME <- 750   # ms

    res <- NULL
    for(i in 5:length(p)) {

        s <- list(x=p[1], y=p[2], level=dbTocd(p[i],4000/pi), size=0.43, duration=200,
                  responseWindow=ifelse(i < length(p), BETWEEN_FLASH_TIME, rwin))
        class(s) <- "opiStaticStimulus"
        res <- c(res, list(s))
    }
    return(res)
}

################################################################
# Read in a key press 'z' is correct==1, 'm' otherwise
#    correct is either 1 or 2, whichever is the correct interval
#   
# Return list(seen={TRUE|FALSE}, time=time, err=NULL))
#        seen is TRUE if correct key pressed
################################################################
## Not run: 
##D if (length(dir(".", "getKeyPress.py")) < 1)
##D    stop('Python script getKeyPress.py missing?')
## End(Not run)

keyHandler <- function(correct, ret) { 
    return(list(seen=TRUE, time=0, err=NULL))
    ONE <- "b'z'"
    TWO <- "b'm'"
    time <- Sys.time()
    key <- 'q'
    while (key != ONE && key != TWO) {
        a <- system('python getKeyPress.py', intern=TRUE)
        key <- a # substr(a, nchar(a), nchar(a))
        print(paste('Key pressed: ',key,'from',a))

        if (key == "b'8'")
            stop('Key 8 pressed')
    }
    time <- Sys.time() - time

    if ((key == ONE && correct == 1) || (key == TWO && correct == 2))
        return(list(seen=TRUE, time=time, err=NULL))
    else
        return(list(seen=FALSE, time=time, err=NULL))
}


################################################################
# Read in return value from opipresent with F310 controller.
# First param is correct, next is 1 for left button, 2 for right button
# Left button (LB) is correct for interval 1, RB for interval 2
#    correct is either 1 or 2, whichever is the correct interval
#   
# Return list(seen={TRUE|FALSE}, time=time, err=NULL))
#        seen is TRUE if correct key pressed
################################################################
F310Handler <- function(correct, opiResult) {
  z <- opiResult$seen == correct
  opiResult$seen <- z
  
  return(opiResult)
}

################################################################
# 2 example beep_function
################################################################
## Not run: 
##D require(beepr)
##D myBeep <- function(type='None') {
##D   if (type == 'correct') {
##D     beepr::beep(2)  # coin noise
##D     Sys.sleep(0.5)
##D   }
##D   if (type == 'incorrect') {
##D     beepr::beep(1) # system("rundll32 user32.dll,MessageBeep -1") # system beep
##D     #Sys.sleep(0.0)
##D   }
##D }
##D 
##D require(audio)
##D myBeep <- function(type="None") {
##D     if (type == 'correct') {
##D       wait(audio::play(sin(1:10000/10)))  
##D     }
##D     if (type == 'incorrect') {
##D       wait(audio::play(sin(1:10000/20)))
##D     }
##D }
## End(Not run)

################################################################
# An example stim_print function
################################################################
## Not run: 
##D stim_print <- function(s, ret) {
##D     sprintf("##D 
##D }
## End(Not run)



