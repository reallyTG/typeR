library(MOTE)


### Name: odds
### Title: Chi-Square Odds Ratios
### Aliases: odds
### Keywords: effect odds ratios size,

### ** Examples


#A health psychologist was interested in the rates of anxiety in
#first generation and regular college students. They polled campus
#and found the following data:

  #|              | First Generation | Regular |
  #|--------------|------------------|---------|
  #| Low Anxiety  | 10               | 50      |
  #| High Anxiety | 20               | 15      |

#What are the odds for the first generation students to have anxiety?

odds(n11 = 10, n12 = 50, n21 = 20, n22 = 15, a = .05)



