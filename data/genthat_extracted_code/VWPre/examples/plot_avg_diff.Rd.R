library(VWPre)


### Name: plot_avg_diff
### Title: Plots average difference between looks to interest areas.
### Aliases: plot_avg_diff

### ** Examples

## Not run: 
##D library(VWPre)
##D # For plotting average differences with SE bars...
##D plot_avg_diff(data = dat, xlim = c(0, 1000), type = "proportion",
##D              DiffCols = c(IA_1_P = "Target", IA_2_P = "Rhyme"),
##D              Condition1 = NA, Condition2 = NA, Cond1Labels = NA, Cond2Labels = NA,
##D              ErrorBar = TRUE, VWPreTheme = TRUE, ErrorBand = FALSE, 
##D              ErrorType = "SE")
##D              
##D # For plotting conditional average differences (one condition) with the 
##D # included theme and 95% pointwise CI bars.
##D plot_avg_diff(data = dat, xlim = c(0, 1000), , type = "proportion",
##D              DiffCols = c(IA_1_P = "Target", IA_2_P = "Rhyme"),
##D            Condition1 = "talker", Condition2 = NA, Cond1Labels = c(CH1 = "Chinese 1", 
##D            CH10 = "Chinese 3", CH9 = "Chinese 2", EN3 = "English 1"),
##D            Cond2Labels = NA, ErrorBar = TRUE, 
##D            VWPreTheme = TRUE, ErrorBand = FALSE, 
##D              ErrorType = "CI", ConfLev = 95, CItype = "pointwise")
##D            
##D # For plotting conditional average differences (two conditions) with the 
##D # included theme and 95% simultaneous CI bands.
##D plot_avg_diff(data = dat, xlim = c(0, 1000), , type = "proportion",
##D              DiffCols = c(IA_1_P = "Target", IA_2_P = "Rhyme"),
##D            Condition1 = "talker", Condition2 = "Exp", Cond1Labels = c(CH1 = "Chinese 1", 
##D            CH10 = "Chinese 3", CH9 = "Chinese 2", EN3 = "English 1"),
##D            Cond2Labels = c(High = "H Exp", Low = "L Exp"), ErrorBar = FALSE, 
##D            VWPreTheme = TRUE, ErrorBand = TRUE, 
##D              ErrorType = "CI", ConfLev = 95, CItype = "simultaneous")
##D 
##D # For a more complete tutorial on VWPre plotting functions:
##D vignette("SR_Plotting", package="VWPre")
## End(Not run)




