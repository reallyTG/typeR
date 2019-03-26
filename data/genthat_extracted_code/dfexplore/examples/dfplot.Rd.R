library(dfexplore)


### Name: dfplot
### Title: Data Frame plot to explore NA and classes
### Aliases: dfplot dfplot,data.frame-method
###   dfplot,Data.frame.description-method

### ** Examples

# Plot quickly a representation of the "example_df" data.frame
dfplot(example_df)

# Plot it with some changes using ggplot layers
graph_data.frame <- dfplot(example_df)

# Change title
with_title<-graph_data.frame + ggtitle("An example of dfplot() with example_df")
with_title

# Change text orientation
horizontal_text<-with_title +  theme(axis.text.x = element_text(angle = 0))
horizontal_text

# Add subject number in the column subject
# May be useful if you want to find quickly the number of a subject
nb_obs <- nrow(example_df)
with_subject_number<-horizontal_text + 
  geom_text(data =example_df,
    aes(y=1:nb_obs,
        x=rep(x=c(0.7,1,1.3),  length.out=nb_obs),
        label =example_df$subject),
    size=3) 

with_subject_number



