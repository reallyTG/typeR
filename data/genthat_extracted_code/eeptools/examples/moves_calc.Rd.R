library(eeptools)


### Name: moves_calc
### Title: Function to calculate the number of times a student has changed
###   schools.
### Aliases: moves_calc

### ** Examples

## Not run: 
##D df <- data.frame(sid = c(rep(1,3), rep(2,4), 3, rep(4,2)), 
##D                  schid = c(1, 2, 2, 2, 3, 1, 1, 1, 3, 1),
##D                  enroll_date = as.Date(c('2004-08-26',
##D                                          '2004-10-01',
##D                                          '2005-05-01',
##D                                          '2004-09-01',
##D                                          '2004-11-03',
##D                                          '2005-01-11',
##D                                          '2005-04-02',
##D                                          '2004-09-26',
##D                                          '2004-09-01',
##D                                          '2005-02-02'), 
##D                                        format='%Y-%m-%d'),
##D                  exit_date = as.Date(c('2004-08-26',
##D                                        '2005-04-10',
##D                                        '2005-06-15',
##D                                        '2004-11-02',
##D                                        '2005-01-10',
##D                                        '2005-03-01',
##D                                        '2005-06-15',
##D                                        '2005-05-30',
##D                                        NA,
##D                                        '2005-06-15'), 
##D                                      format='%Y-%m-%d'))
##D moves <- moves_calc(df)
##D moves
##D moves <- moves_calc(df, enrollby='2004-10-15', gap=22)
##D moves
##D moves <- moves_calc(df, enrollby='2004-10-15', exitby='2005-05-29')
##D moves
## End(Not run)




