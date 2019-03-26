library(pMineR)


### Name: confCheck_easy
### Title: A simple conformance checking class
### Aliases: confCheck_easy

### ** Examples

## Not run: 
##D 
##D #  Create a Conformance Checker obj
##D obj.cc <- confCheck_easy()
##D 
##D # Load an XML with the workflow to check
##D obj.cc$loadWorkFlow( WF.fileName='../otherFiles/import_01/rules.v2.xml' )
##D 
##D # plot the graph related to the XML
##D obj.cc$plot()
##D 
##D # now play 20 processes, 10 correct and 10 mismatchful 
##D # (matching and not matching can be seen thanks to the 'valido' column)
##D aaa <- obj.cc$play(number.of.cases = 20,min.num.of.valid.words = 10)
##D 
##D # Build a dataLoaderObject
##D objDL <- dataLoader()
##D 
##D # load the previously genearated data.frame
##D objDL$load.data.frame(mydata = aaa$valid.data.frame,IDName = "patID",
##D EVENTName = "event",dateColumnName = "date")
##D 
##D # now load the data into the obj
##D obj.cc$loadDataset(dataList = objDL$getData())
##D # replay the loaded data
##D obj.cc$replay()
##D 
##D # plot the result, showing the terminations in absolute values
##D obj.cc$plot.replay.result(whatToCount = "terminations",
##D kindOfNumber = "absolute")
##D # plot the result, showing the transitions in relative values
##D obj.cc$plot.replay.result(whatToCount = "activations",
##D kindOfNumber = "relative")
##D 
##D # get the XML of the replay
##D xmlText <- obj.cc$get.XML.replay.result()
##D # or the same data in form of list
##D list.result <- obj.cc$get.list.replay.result()
##D 
##D # plot the timeline of the first patient
##D # and the timeline computed during the re-play
##D obj.cc$plotPatientEventTimeLine(patientID = "1")
##D obj.cc$plotPatientReplayedTimeline(patientID = "1")
##D 
## End(Not run)



