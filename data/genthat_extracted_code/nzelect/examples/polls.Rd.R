library(nzelect)


### Name: polls
### Title: New Zealand Opinion Polls
### Aliases: polls
### Keywords: datasets

### ** Examples

if(require(ggplot2) & require(scales) & require(dplyr) & require(forcats)){
election_dates <- polls %>%
    filter(Pollster == "Election result") %>%
    select(MidDate) %>%
    distinct()

polls %>%
    filter(Party %in% c("National", "Labour", "Green", "NZ First")) %>%
    mutate(Party = fct_reorder(Party, VotingIntention, .desc = TRUE),
           Pollster = fct_relevel(Pollster, "Election result")) %>%
    ggplot(aes(x = MidDate, y = VotingIntention, linetype = Pollster)) +
    geom_line(alpha = 0.5) +
    geom_point(aes(colour = Client), size = 0.7) +
    geom_smooth(aes(group = Party), se = FALSE, colour = "grey15", span = .20) +
    scale_y_continuous("Voting intention", label = percent) +
    scale_x_date("") +
    facet_wrap(~Party, scales = "free_y") +
    geom_vline(xintercept = as.numeric(election_dates$MidDate), colour = "grey80") 
}



