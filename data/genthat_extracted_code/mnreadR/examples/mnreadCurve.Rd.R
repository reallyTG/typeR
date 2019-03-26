library(mnreadR)


### Name: mnreadCurve
### Title: MNREAD curve plotting.
### Aliases: mnreadCurve

### ** Examples

# inspect the structure of the dataframe
head(data_low_vision, 10)

#------

# restrict dataset to one MNREAD test only (subject s1, regular polarity)
data_s1_reg <- data_low_vision %>%
   filter (subject == "s1", polarity == "regular")

# plot the MNREAD curve 
## Not run:  mnreadCurve(data_s1_reg, ps, vd, rt, err)  

#------

# restrict dataset to one subject (s1) and plot the MNREAD curves using ONE GROUPING ARGUMENT 
# (ie. polarity) 
data_s1 <- data_low_vision %>%
   filter (subject == "s1")

# plot the MNREAD curve using ONE GROUPING ARGUMENT (ie. polarity)
 ## Not run:  mnreadCurve(data_s1, ps, vd, rt, err, polarity)  

#------

# restrict dataset to two subject (s1 & s2) and plot the MNREAD curves using TWO GROUPING ARGUMENTS 
# (ie. subject and polarity) 
data_s2 <- data_low_vision %>%
   filter (subject == "s1" | subject == "s2")

 ## Not run:  mnreadCurve(data_s2, ps, vd, rt, err, subject, polarity)  

#------

# Once created, the MNREAD curve can be customized as needed using ggplot2, 
# for ex., by adding the number of errors for each sentence on top of the curve

# plot the MNREAD curve 
my.plot <- mnreadCurve(data_s1, ps, vd, rt, err, polarity)

# display my.plot
print(my.plot)

# calculate reading speed and perform print size correction
data_s1_new <- as.data.frame(
data_s1 %>%
    filter (err != "NA" & rt > 0) %>%
    mutate (errors10 = replace (err, err > 10, 10) ) %>%
    mutate (rs = 60 * (10 - errors10) / rt ) %>%
    mutate (correct_ps = ps + round(log10(40/(vd)), 2)) ) 

# add the number of errors for each sentence 
my.new.plot <- my.plot + geom_text(aes(x = correct_ps, y = rs + 5, label = errors10),
                                   alpha = 0.5,
                                   data = data_s1_new %>% filter (errors10 != 0) )

# display my.new.plot                                                                        
print(my.new.plot)

#------

# MNREAD curves can also be saved in a pdf file, with each page showing a different subject
 
# count the number of subjects to define the number of pages
num_pages = length(unique(data_s2$subject))

# create a pdf file 
pdf ("MNREAD_curves.pdf", width = 10.5, height = 8, paper = "special", useDingbats = TRUE)

# wrap the plots over several pages
for (i in seq(num_pages)){
    p <- mnreadCurve(data_s2 %>% filter (subject == sort(unique(data_s2$subject))[i]),
                     ps, vd, rt, err, subject, polarity)
    print(p)
}

dev.off()





