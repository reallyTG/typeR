library(panelView)


### Name: panelView
### Title: Panel Data Visualizations
### Aliases: panelView

### ** Examples

library(panelView)
data(panelView)
panelView(turnout ~ policy_edr + policy_mail_in + policy_motor, 
          data = turnout, index = c("abb","year"))



