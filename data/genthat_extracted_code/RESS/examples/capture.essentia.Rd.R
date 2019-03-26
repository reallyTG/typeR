library(RESS)


### Name: capture.essentia
### Title: capture.essentia
### Aliases: capture.essentia

### ** Examples

## Not run: 
##D --------------------------------------------------------------------------------------------------
##D 
##D These examples require Essentia to be installed:
##D 
##D queryfile <- file("examplequery.sh","w")
##D cat("ess exec \"echo -e '11,12,13\n4,5,6\n7,8,9'\" #-notitle \n",file=queryfile)
##D cat("ess exec \"echo -e '11,12,13\n4,5,6\n7,8,9'\" \n", file=queryfile)
##D cat("ess exec \"echo -e '11,12,13\n4,5,6\n7,8,9'\" #Rignore \n", file=queryfile)
##D capture.essentia("examplequery.sh")
##D print(command1)
##D print(command2)
##D print("The last statement is ignored by R and just executed on the command line.")
##D 
##D --------------------------------------------------------------------------------------------------
##D 
##D This example requires Essentia to have selected a datastore containing purchase log data:
##D 
##D Store these lines as querypurchase.sh:
##D 
##D ess query "select count(refID) from purchase:2014-09-01:2014-09-15 \
##D where articleID>=46 group by price" #Rinclude
##D ess query "select count(distinct userID) from purchase:2014-09-01:2014-09-15 \
##D where articleID>=46" #Rinclude
##D ess query "select count(refID) from purchase:2014-09-01:2014-09-15 \
##D where articleID>=46 group by userID" #Rinclude
##D ess query "select * from purchase:*:* where articleID <= 20" #Rinclude #R#querystream#R# #-notitle
##D 
##D -----------------------------------------------
##D 
##D Then run these commands in R:
##D 
##D library(RESS)
##D capture.essentia("querypurchase.sh")
##D print(command1)
##D print(command2)
##D print(command3)
##D print(querystream)
##D 
##D --------------------------------------------------------------------------------------------------
##D 
##D The following example requires Essentia to be installed with apache log data stored in it.
##D 
##D Store the following lines as queryapache.sh:
##D 
##D # Query the Essentia database logsapache3 and save the contents of vector3 in R as command1.
##D ess exec "aq_udb -exp logsapache3:vector3" --debug
##D 
##D # Query the Essentia database logsapache1 and save the sorted contents of vector1 in R as command2.
##D ess exec "aq_udb -exp logsapache1:vector1 -sort pagecount -dec" --debug
##D 
##D # Stream the last five lines of the file in category 125accesslogs between dates 2014-12-07 and
##D # 2014-12-07, convert them to csv, return them to R, and store them into an R dataframe singlefile.
##D ess stream 125accesslogs '2014-12-07' '2014-12-07' "tail -5 \
##D | logcnv -f,eok - -d ip:ip sep:' ' s:rlog sep:' ' s:rusr sep:' [' i,tim:time sep:'] \"' \
##D s,clf:req_line1 sep:' ' s,clf:req_line2 sep:' ' s,clf:req_line3 sep:'\" ' i:res_status sep:' ' \
##D i:res_size sep:' \"' s,clf:referrer sep:'\" \"' \
##D s,clf:user_agent sep:'\"' X | cat -" #Rinclude #R#singlefile#R#
##D 
##D # Stream the last five lines of the files in category 125accesslogs between dates 2014-11-30 and
##D # 2014-12-07, convert them to csv, and save them into R dataframes apachefiles1 and apachefiles2.
##D ess stream 125accesslogs '2014-11-30' '2014-12-07' "tail -5 \
##D | logcnv -f,eok - -d ip:ip sep:' ' s:rlog sep:' ' s:rusr sep:' [' i,tim:time sep:'] \"' \
##D s,clf:req_line1 sep:' ' s,clf:req_line2 sep:' ' s,clf:req_line3 sep:'\" ' i:res_status sep:' ' \
##D i:res_size sep:' \"' s,clf:referrer sep:'\" \"' s,clf:user_agent sep:'\"' X -notitle | cat -" \
##D #Rinclude #R#apachefiles#R# #Rseparate
##D 
##D -----------------------------------------------
##D 
##D Then run these commands in R:
##D 
##D library(RESS)
##D capture.essentia("queryapache.sh")
##D 
##D print(command1)
##D print(command2)
##D print(singlefile)
##D print(apachefiles1)
##D print(apachefiles2)
##D 
##D The references contain more extensive examples that
##D fully walkthrough how to load and query the Essentia Database.
##D 
## End(Not run)



