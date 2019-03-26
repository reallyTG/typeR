library(ez)


### Name: ezPlot
### Title: Plot data from a factorial experiment
### Aliases: ezPlot

### ** Examples

#Read in the ANT data (see ?ANT).
data(ANT)
head(ANT)
ezPrecis(ANT)


## Not run: 
##D #Run an ANOVA on the mean correct RT data.
##D mean_rt_anova = ezANOVA(
##D     data = ANT[ANT$error==0,]
##D     , dv = .(rt)
##D     , wid = .(subnum)
##D     , within = .(cue,flank)
##D     , between = .(group)
##D )
##D 
##D #Show the ANOVA and assumption tests.
##D print(mean_rt_anova)
## End(Not run)

#Plot the main effect of group.
group_plot = ezPlot(
    data = ANT[ANT$error==0,]
    , dv = .(rt)
    , wid = .(subnum)
    , between = .(group)
    , x = .(group)
    , do_lines = FALSE
    , x_lab = 'Group'
    , y_lab = 'RT (ms)'
)

#Show the plot.
print(group_plot)

#tweak the plot
# group_plot = group_plot +
# theme(
#     panel.grid.major = element_blank()
#     , panel.grid.minor = element_blank()
# )
# print(group_plot)



#use the "print_code" argument to print the
# code for creating the plot and return the
# data to plot. This is useful when you want
# to learn how to create plots from scratch
# (which can in turn be useful when you can't
# get a combination of ezPlot and tweaking to
# achieve what you want)
group_plot_data = ezPlot(
    data = ANT[ANT$error==0,]
    , dv = .(rt)
    , wid = .(subnum)
    , between = .(group)
    , x = .(group)
    , do_lines = FALSE
    , x_lab = 'Group'
    , y_lab = 'RT (ms)'
    , print_code = TRUE
)


#Re-plot the main effect of group, using the levels
##argument to re-arrange/rename levels of group
group_plot = ezPlot(
    data = ANT[ANT$error==0,]
    , dv = .(rt)
    , wid = .(subnum)
    , between = .(group)
    , x = .(group)
    , do_lines = FALSE
    , x_lab = 'Group'
    , y_lab = 'RT (ms)'
    , levels = list(
        group = list(
            new_order = c('Treatment','Control')
            , new_names = c('Treatment\nGroup','Control\nGroup')
        )
    )
)

#Show the plot.
print(group_plot)


#Plot the cue*flank interaction.
cue_by_flank_plot = ezPlot(
    data = ANT[ANT$error==0,]
    , dv = .(rt)
    , wid = .(subnum)
    , within = .(cue,flank)
    , x = .(flank)
    , split = .(cue)
    , x_lab = 'Flanker'
    , y_lab = 'RT (ms)'
    , split_lab = 'Cue'
)

#Show the plot.
print(cue_by_flank_plot)


#Plot the cue*flank interaction by collapsing the cue effect to
##the difference between None and Double
cue_by_flank_plot2 = ezPlot(
    data = ANT[ ANT$error==0 & (ANT$cue %in% c('None','Double')) ,]
    , dv = .(rt)
    , wid = .(subnum)
    , within = .(flank)
    , diff = .(cue)
    , reverse_diff = TRUE
    , x = .(flank)
    , x_lab = 'Flanker'
    , y_lab = 'RT Effect (None - Double, ms)'
)

#Show the plot.
print(cue_by_flank_plot2)



#Plot the group*cue*flank interaction.
group_by_cue_by_flank_plot = ezPlot(
    data = ANT[ANT$error==0,]
    , dv = .(rt)
    , wid = .(subnum)
    , within = .(cue,flank)
    , between = .(group)
    , x = .(flank)
    , split = .(cue)
    , col = .(group)
    , x_lab = 'Flanker'
    , y_lab = 'RT (ms)'
    , split_lab = 'Cue'
)

#Show the plot.
print(group_by_cue_by_flank_plot)


#Plot the group*cue*flank interaction in both error rate and mean RT.
group_by_cue_by_flank_plot_both = ezPlot(
    data = list(
        ANT
        , ANT[ANT$error==0,]
    )
    , dv = .(error,rt)
    , wid = .(subnum)
    , within = .(cue,flank)
    , between = .(group)
    , x = .(flank)
    , split = .(cue)
    , col = .(group)
    , x_lab = 'Flanker'
    , split_lab = 'Cue'
    , dv_labs = c('ER (%)', 'RT (ms)')
    , y_free = TRUE
)

#Show the plot.
print(group_by_cue_by_flank_plot_both)





