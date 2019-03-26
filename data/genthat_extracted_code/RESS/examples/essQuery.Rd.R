library(RESS)


### Name: essQuery
### Title: essQuery
### Aliases: essQuery

### ** Examples

## Not run: 
##D --------------------------------------------------------------------------------------------------
##D 
##D These examples require Essentia to be installed:
##D 
##D fullexec <- essQuery("ess exec", "echo -e '11,12,13\n4,5,6\n7,8,9' ","#-notitle")
##D print(fullexec)
##D defaultexec <- essQuery("echo -e '11,12,13\n4,5,6\n7,8,9' ","#-notitle")
##D print(defaultexec)
##D essQuery("echo -e '11,12,13\n4,5,6\n7,8,9' ","#Rignore")
##D print("This last statement is ignored by R and just executed on the command line.")
##D 
##D --------------------------------------------------------------------------------------------------
##D 
##D This example requires Essentia to have selected a datastore containing purchase log data:
##D 
##D command1 <- essQuery("ess query","select count(refID) from purchase:2014-09-01:2014-09-15 \
##D where articleID>=46 group by price","#Rinclude")
##D command2 <- essQuery("ess query", "select count(distinct userID) from \
##D purchase:2014-09-01:2014-09-15 where articleID>=46", "#Rinclude")
##D command3 <- essQuery("ess query", "select count(refID) from \
##D purchase:2014-09-01:2014-09-15 where articleID>=46 group by userID", "#Rinclude")
##D querystream <- essQuery("ess query", "select * from purchase:*:* where articleID <= 20", "\
##D #Rinclude #-notitle")
##D 
##D Then run these commands to view the saved dataframes:
##D 
##D print(command1)
##D print(command2)
##D print(command3)
##D print(querystream)
##D 
##D --------------------------------------------------------------------------------------------------
##D 
##D The following example requires Essentia to be installed with apache log data stored in it:
##D 
##D # Query the Essentia database logsapache3 and return the contents of vector3 into R.
##D command1 <- essQuery("aq_udb -exp logsapache3:vector3", "--debug")
##D 
##D # Query the Essentia database logsapache1 and return the sorted contents of vector1 into R.
##D command2 <- essQuery("ess exec", "aq_udb -exp logsapache1:vector1 -sort pagecount -dec", "\
##D --debug")
##D 
##D # Stream the last five lines of the file in category 125accesslogs between dates 2014-12-07 and
##D # 2014-12-07, convert them to csv, return them to R, and store them into an R dataframe singlefile.
##D singlefile <- essQuery("ess stream 125accesslogs '2014-12-07' '2014-12-07'","tail -5 \
##D | logcnv -f,eok - -d ip:ip sep:' ' s:rlog sep:' ' s:rusr sep:' [' i,tim:time sep:'] \\"' \
##D s,clf:req_line1 sep:' ' s,clf:req_line2 sep:' ' s,clf:req_line3 sep:'\\" ' i:res_status sep:' ' \
##D i:res_size sep:' \\"' s,clf:referrer sep:'\\" \\"' \
##D s,clf:user_agent sep:'\\"' X | cat -","#Rinclude")
##D 
##D # Stream the last five lines of the files in category 125accesslogs between dates 2014-11-30 and 
##D # 2014-12-07, convert them to csv, and save them into R dataframes apachefiles1 and apachefiles2.
##D essQuery("ess stream 125accesslogs '2014-11-30' '2014-12-07'","tail -5 \
##D | logcnv -f,eok - -d ip:ip sep:' ' s:rlog sep:' ' s:rusr sep:' [' i,tim:time sep:'] \\"' \
##D s,clf:req_line1 sep:' ' s,clf:req_line2 sep:' ' s,clf:req_line3 sep:'\\" ' i:res_status sep:' ' \
##D i:res_size sep:' \\"' s,clf:referrer sep:'\\" \\"' \
##D s,clf:user_agent sep:'\\"' X -notitle | cat -","\
##D #Rinclude #R#apachefiles#R# #Rseparate")
##D 
##D print(command1)
##D print(command2)
##D print(singlefile)
##D print(apachefiles1)
##D print(apachefiles2)
##D 
##D The references contain more extensive examples that 
##D fully walkthrough how to load and query the Essentia Database.
## End(Not run)



