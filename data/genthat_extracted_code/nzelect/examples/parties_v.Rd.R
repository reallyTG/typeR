library(nzelect)


### Name: parties_v
### Title: New Zealand political party colours
### Aliases: parties_v
### Keywords: datasets

### ** Examples

# Example use of parties_v in a colour scale for ggplot2
if(require(ggplot2) & require(scales) & require(dplyr) & require(forcats)){
polls %>%
    filter(MidDate > as.Date("2014-11-20") & !is.na(VotingIntention)) %>%
    filter(Party %in% c("National", "Labour", "Green", "NZ First")) %>%
    mutate(Party = fct_reorder(Party, VotingIntention, .desc = TRUE),
           Party = fct_drop(Party)) %>%
    ggplot(aes(x = MidDate, y = VotingIntention, colour = Party, linetype = Pollster)) +
    geom_line(alpha = 0.5) +
    geom_point(aes(shape = Pollster)) +
    geom_smooth(aes(group = Party), se = FALSE, colour = "grey15", span = .4) +
    scale_colour_manual(values = parties_v) +
    scale_y_continuous("Voting intention", label = percent) +
    scale_x_date("") +
    facet_wrap(~Party, scales = "free_y") 
    }



