library(VWPre)


### Name: plot_avg
### Title: Plots average looks to interest areas.
### Aliases: plot_avg

### ** Examples

## Not run: 
##D library(VWPre)
##D # For plotting the grand average with the included theme and SE bars
##D plot_avg(data = dat, type = "elogit", xlim = c(0, 1000), 
##D    IAColumns = c(IA_1_ELogit = "Target", IA_2_ELogit = "Rhyme", 
##D    IA_3_ELogit = "OnsetComp", IA_4_ELogit = "Distractor"), 
##D    Averaging = "Event", Condition1 = NA, Condition2 = NA, 
##D    Cond1Labels = NA, Cond2Labels = NA,
##D    ErrorBar = TRUE, VWPreTheme = TRUE, ErrorType = "SE",
##D    ErrorBand = FALSE) 
##D    
##D # For plotting conditional averages (one condition) with the included theme
##D # and 95% simultaneous CI bars.
##D # This produces plots arranged horizontally
##D plot_avg(data = dat, type = "elogit", xlim = c(0, 1000), 
##D    IAColumns = c(IA_1_ELogit = "Target", IA_2_ELogit = "Rhyme", 
##D    IA_3_ELogit = "OnsetComp", IA_4_ELogit = "Distractor"),
##D    Averaging = "Event", Condition1 = NA, Condition2 = "talker", 
##D    Cond1Labels = NA, 
##D    Cond2Labels = c(CH1 = "Chinese 1", CH10 = "Chinese 3", CH9 = "Chinese 2", 
##D    EN3 = "English 1"), ErrorBar = TRUE, VWPreTheme = TRUE,
##D    ErrorBand = FALSE, ErrorType = "CI", ConfLev = 95, CItype = "simultaneous")
##D 
##D # For plotting conditional averages (two conditions) for one interest area
##D with the included theme and 95% simultaneous CI bands.
##D # This produces plots arranged in grid format.
##D plot_avg(data = dat, type = "elogit", xlim = c(0, 1000),
##D    IAColumns = c(IA_1_ELogit = "Target"), Averaging = "Event", 
##D    Condition1 = "talker", Condition2 = "Exp",
##D    Cond1Labels = c(CH1 = "Chinese 1", CH10 = "Chinese 3", CH9 = "Chinese 2", 
##D    EN3 = "English 1"), Cond2Labels = c(High = "H Exp", Low = "L Exp"),
##D    ErrorBar = FALSE, VWPreTheme = TRUE, ErrorBand = TRUE, 
##D    ErrorType = "CI", ConfLev = 95, CItype = "simultaneous")
##D 
##D #' # For a more complete tutorial on VWPre plotting functions:
##D vignette("SR_Plotting", package="VWPre")
## End(Not run)




