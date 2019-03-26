library(atable)


### Name: indent_data_frame
### Title: Indents data.frames
### Aliases: indent_data_frame

### ** Examples


DD <- expand.grid(Arm = paste0('Arm ', c(1,2,4)),
                Gender = c('Male', 'Female'),
                Haircolor = c('Red', 'Green', 'Blue'),
                Income = c('Low', 'Med', 'High'), stringsAsFactors = TRUE)

DD <- doBy::orderBy(~ Arm + Gender + Haircolor + Income, DD)

DD$values1 <- runif(dim(DD)[1])
DD$values2 <- 1
DD$values3 <- sample(letters[1:4], size = nrow(DD), replace = TRUE)

keys = c('Arm', 'Gender', 'Haircolor', 'Income')
values = c('values1', 'values2', 'values3')
## Not run: 
##D DDD <- indent_data_frame(DD, keys, indent_character = '   ')
##D 
##D # print both:
##D 
##D Hmisc::latex(DD,
##D       file = '',
##D       longtable = TRUE,
##D       caption = 'Original table',
##D       rowname = NULL)
##D 
##D Hmisc::latex(DDD,
##D       file = '',
##D       longtable = TRUE,
##D       caption = 'Indented table',
##D       rowname = NULL)
##D       
## End(Not run)



