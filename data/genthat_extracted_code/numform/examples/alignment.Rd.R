library(numform)


### Name: alignment
### Title: Detect Column Alignment
### Aliases: alignment

### ** Examples

CO <- CO2
CO[] <- lapply(CO, as.character)
alignment(CO)
head(CO2)


## Not run: 
##D ## pander
##D pacman::p_load(dplyr, pander)
##D 
##D set.seed(10)
##D dat <- data_frame(
##D     Team = rep(c("West Coast", "East Coast"), each = 4),
##D     Year = rep(2012:2015, 2),
##D     YearStart = round(rnorm(8, 2e6, 1e6) + sample(1:10/100, 8, TRUE), 2),
##D     Won = round(rnorm(8, 4e5, 2e5) + sample(1:10/100, 8, TRUE), 2),
##D     Lost = round(rnorm(8, 4.4e5, 2e5) + sample(1:10/100, 8, TRUE), 2),
##D     WinLossRate = Won/Lost,
##D     PropWon = Won/YearStart,
##D     PropLost = Lost/YearStart
##D )
##D 
##D 
##D dat %>%
##D     group_by(Team) %>%
##D     mutate(
##D         `%&Delta;WinLoss` = fv_percent_diff(WinLossRate, 0),
##D         `&Delta;WinLoss` = f_sign(Won - Lost, '<b>+</b>', '<b>&ndash;</b>')
##D 
##D     ) %>%
##D     ungroup() %>%
##D     mutate_at(vars(Won:Lost), .funs = ff_denom(relative = -1, prefix = '$')) %>%
##D     mutate_at(vars(PropWon, PropLost), .funs = ff_prop2percent(digits = 0)) %>%
##D     mutate(
##D         YearStart = f_denom(YearStart, 1, prefix = '$'),
##D         Team = fv_runs(Team),
##D         WinLossRate = f_num(WinLossRate, 1)
##D     ) %>%
##D     as.data.frame() %>%
##D     pander::pander(split.tables = Inf, justify = alignment(.))
##D 
##D ## xtable
##D pacman::p_load(xtable)
##D 
##D alignment(CO, 'l', 'r')
##D 
##D CO %>%
##D     xtable(align = c('', alignment(CO, 'l', 'r'))) %>%
##D     print(include.rownames = FALSE)
##D 
##D 
##D CO %>%
##D     xtable(align = c('', alignment(CO, 'l|', 'r|'))) %>%
##D     print(include.rownames = FALSE)
## End(Not run)



