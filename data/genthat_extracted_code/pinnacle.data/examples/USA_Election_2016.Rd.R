library(pinnacle.data)


### Name: USA_Election_2016
### Title: USA_Election_2016
### Aliases: USA_Election_2016
### Keywords: datasets

### ** Examples

if (require("odds.converter")) {
library(tidyverse)
# What is Hilary Clinton's the highest implied winning probability at Pinnacle?

USA_Election_2016[which.min(USA_Election_2016$MoneyUS1),"EnteredDateTime"]
odds.converter::odds.us2prob(min(USA_Election_2016$MoneyUS1))
}

# What time on election night that Trump's implied winning probability surpassed Clinton's?
if (require("tidyverse")) {
library(tidyverse)
USA_Election_2016 %>% 
 filter(MoneyUS1>MoneyUS2) %>%
 slice(1)
}



