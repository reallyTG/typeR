library(SixSigma)


### Name: ss.ceDiag
### Title: Cause and Effect Diagram
### Aliases: ss.ceDiag
### Keywords: cause-and-effect

### ** Examples

effect <- "Flight Time"
causes.gr <- c("Operator", "Environment", "Tools", "Design", 
  "Raw.Material", "Measure.Tool")
causes <- vector(mode = "list", length = length(causes.gr))
causes[1] <- list(c("operator #1", "operator #2", "operator #3"))
causes[2] <- list(c("height", "cleaning"))
causes[3] <- list(c("scissors", "tape"))
causes[4] <- list(c("rotor.length", "rotor.width2", "paperclip"))
causes[5] <- list(c("thickness", "marks"))
causes[6] <- list(c("calibrate", "model"))
ss.ceDiag(effect, causes.gr, causes, sub = "Paper Helicopter Project")




