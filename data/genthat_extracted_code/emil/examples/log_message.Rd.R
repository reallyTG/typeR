library(emil)


### Name: log_message
### Title: Print a timestamped and indented log message
### Aliases: log_message

### ** Examples

equipment <- c("flashlight", "snacks", "pick")
{
    log_message(1, "Begin descent")
    log_message(2, "Oh no, forgot the %s!", sample(equipment, 1))
    log_message(2, "Hello? Can you throw it down to me?", time=FALSE)
    log_message(1, "Aw shucks, I'm coming back up.")
}

for(verbose in c(TRUE, FALSE)){
    cat("It's", verbose, "\n")
    for(i in 0:3)
        log_message(indent(verbose, i), "Down")
}

options(emil_max_indent = 2)
for(i in 1:3)
    log_message(i, "Down")



