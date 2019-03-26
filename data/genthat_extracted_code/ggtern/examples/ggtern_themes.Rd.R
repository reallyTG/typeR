library(ggtern)


### Name: ggtern_themes
### Title: ggtern themes
### Aliases: ggtern_themes theme_ggtern theme_gray theme_bw theme_linedraw
###   theme_light theme_minimal theme_classic theme_dark theme_void
###   theme_darker theme_custom theme_rgbw theme_rgbg theme_matrix
###   theme_tropical theme_bluedark theme_bluelight theme_bvbw theme_bvbg

### ** Examples

## No test: 
#Create a list of the theme suffixes
themesOrg = c('gray','bw','linedraw','light',
              'dark','minimal','classic','void')
themesNew = c('custom','darker','rgbw','rgbg','tropical',
              'matrix','bluelight','bluedark','bvbw','bvbg')

#Iterate over all the suffixes, creating a list of plots
plotThemes = function(themes){
   grobs = lapply(themes,function(x){
     thmName = sprintf("theme_%s",x)
     thm = do.call(thmName,args=list(base_size=9))
     df  = data.frame(label=thmName)
     ggtern(df) + facet_wrap(~label) + thm
   })
   grobs
}

#Arrange the Original Themes
grid.arrange(grobs=plotThemes(themesOrg),top = "Collection of Themes (Original)")

#Arrange the New Themes
grid.arrange(grobs=plotThemes(themesNew),top = "Collection of Themes (New Themes)")
## End(No test)




