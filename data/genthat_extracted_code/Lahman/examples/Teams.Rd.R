library(Lahman)


### Name: Teams
### Title: Teams table
### Aliases: Teams
### Keywords: datasets

### ** Examples

data(Teams)
library("dplyr")
library("tidyr")

# Add some selected measures to the Teams data frame
# Restrict to AL and NL in modern era
teams <- Teams %>% 
  filter(yearID >= 1901 & lgID %in% c("AL", "NL")) %>%
  group_by(yearID, teamID) %>%
  mutate(TB = H + X2B + 2 * X3B + 3 * HR,
         WinPct = W/G,
         rpg = R/G,
         hrpg = HR/G,
         tbpg = TB/G,
         kpg = SO/G,
         k2bb = SO/BB,
         whip = 3 * (H + BB)/IPouts)

# Function to create a ggplot by year for selected team stats
# Both arguments are character strings
yrPlot <- function(yvar, label)
{
    require("ggplot2")
    ggplot(teams, aes_string(x = "yearID", y = yvar)) +
       geom_point(size = 0.5) +
       geom_smooth(method="loess") +
       labs(x = "Year", y = paste(label, "per game"))
}

## Run scoring in the modern era by year
yrPlot("rpg", "Runs")

## Home runs per game by year
yrPlot("hrpg", "Home runs")

## Total bases per game by year
yrPlot("tbpg", "Total bases")

## Strikeouts per game by year
yrPlot("kpg", "Strikeouts")

## Plot win percentage vs. run differential (R - RA)
ggplot(teams, aes(x = R - RA, y = WinPct)) +
   geom_point(size = 0.5) +
   geom_smooth(method="loess") + 
   geom_hline(yintercept = 0.5, color = "orange") +
   geom_vline(xintercept = 0, color = "orange") +
   labs(x = "Run differential", y = "Win percentage")

## Plot attendance vs. win percentage by league, post-1980
teams %>%  filter(yearID >= 1980) %>%
ggplot(., aes(x = WinPct, y = attendance/1000)) +
   geom_point(size = 0.5) +
   geom_smooth(method="loess", se = FALSE) +
   facet_wrap(~ lgID) +
   labs(x = "Win percentage", y = "Attendance (1000s)")

## Teams with over 4 million attendance in a season
teams %>% 
  filter(attendance >= 4e6) %>%
  select(yearID, lgID, teamID, Rank, attendance) %>%
  arrange(desc(attendance))

## Average season HRs by park, post-1980
teams %>% 
   filter(yearID >= 1980) %>%
   group_by(park) %>%
     summarise(meanHRpg = mean((HR + HRA)/Ghome), nyears = n()) %>%
     filter(nyears >= 10) %>%
     arrange(desc(meanHRpg)) %>%
     head(., 10)

## Home runs per game at Fenway Park and Wrigley Field,
## the two oldest MLB parks, by year. Fenway opened in 1912.
teams %>% 
  filter(yearID >= 1912 & teamID %in% c("BOS", "CHN")) %>%
  mutate(hrpg = (HR + HRA)/Ghome) %>%
  ggplot(., aes(x = yearID, y = hrpg, color = teamID)) +
    geom_line(size = 1) +
    geom_point() +
    labs(x = "Year", y = "Home runs per game", color = "Team") +
    scale_color_manual(values = c("red", "blue"))

## Ditto for total strikeouts per game
teams %>% 
  filter(yearID >= 1912 & teamID %in% c("BOS", "CHN")) %>%
  mutate(kpg = (SO + SOA)/Ghome) %>%
  ggplot(., aes(x = yearID, y = kpg, color = teamID)) +
  geom_line(size = 1) +
  geom_point() +
  labs(x = "Year", y = "Strikeouts per game", color = "Team") +
  scale_color_manual(values = c("red", "blue"))  


## Not run: 
##D if(require(googleVis)) {
##D motion1 <- gvisMotionChart(as.data.frame(teams), 
##D              idvar="teamID", timevar="yearID", chartid="gvisTeams",
##D 	           options=list(width=700, height=600))
##D plot(motion1)
##D #print(motion1, file="gvisTeams.html")
##D 
##D # Merge with avg salary for years where salary is available
##D 
##D teamsal <- Salaries %>%
##D                 group_by(yearID, teamID) %>%
##D                 summarise(Salary = sum(salary, na.rm = TRUE)) %>%
##D                 select(yearID, teamID, Salary)
##D 
##D teamsSal <- teams %>%
##D                 filter(yearID >= 1985) %>%
##D                 left_join(teamsal, by = c("yearID", "teamID")) %>%
##D                 select(yearID, teamID, attendance, Salary, WinPct) %>%
##D                 as.data.frame(.)
##D 
##D motion2 <- gvisMotionChart(teamsSal, idvar="teamID", timevar="yearID",
##D   xvar="attendance", yvar="salary", sizevar="WinPct",
##D 	chartid="gvisTeamsSal", options=list(width=700, height=600))
##D plot(motion2)
##D #print(motion2, file="gvisTeamsSal.html")
##D 
##D }
## End(Not run)



