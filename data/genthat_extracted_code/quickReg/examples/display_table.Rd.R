library(quickReg)


### Name: display_table
### Title: Display a table used in paper
### Aliases: display_table display_table_group

### ** Examples

## Not run: 
##D data(diabetes)
##D head(diabetes)
##D library(dplyr);library(rlang)
##D result_1<-diabetes %>%
##D  group_by(sex) %>%
##D  do(display_table(data=.,variables=c("age","smoking"),group="CFHrs2230199")) %>%
##D  ungroup()
##D result_2<-display_table_group(data=diabetes,variables=c("age","smoking"),
##D group="CFHrs2230199",super_group = "sex")
##D identical(result_1,result_2)
##D result_3<-display_table_group(data=diabetes,variables=c("age","education"),
##D group=c("smoking"),super_group = c("CFHrs2230199","sex"))
##D result_4<-display_table_group(data=diabetes,variables=c("age","education"),
##D group=c("smoking"),super_group = c("CFHrs2230199","sex"),group_combine=TRUE)
## End(Not run)



