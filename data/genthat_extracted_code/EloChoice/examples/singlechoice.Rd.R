library(EloChoice)


### Name: singlechoice
### Title: update stimulus ratings after one rating event
### Aliases: singlechoice

### ** Examples

# little change because rating difference is large (positive), i.e. expectation is clear
singlechoice(1200, 500, 100)
# no change because rating difference is very large (positive), i.e. expectation is clear
singlechoice(1500, 500, 100)
# large change because rating difference is small (negative), i.e. expectation is clearly violated
singlechoice(500, 1500, 100)



