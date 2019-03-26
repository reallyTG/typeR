library(move)


### Name: getMovebank
### Title: Download Data from Movebank
### Aliases: getMovebank getMovebank,character,missing-method
###   getMovebank,character,MovebankLogin-method

### ** Examples

## Not run: 
##D 
##D ## first create the login object 
##D login <- movebankLogin()
##D 
##D ## get Movebank ID from study
##D studyID <- getMovebankID(study="MPIO white stork lifetime tracking data (2013-2014)", 
##D 			 login=login)
##D studyID2 <- getMovebankID(study="BCI Ocelot", login=login)
##D 
##D ## get a summary of information about the two studies
##D getMovebank("study", login=login, study_id=c(studyID,studyID2)) 
##D 
##D ## get tag reference information from the study
##D head(getMovebank("tag", login=login, study_id=studyID))
##D 
##D ## get animal reference information from the study
##D head(getMovebank("individual", login=login, study_id=studyID))
##D 
##D ## get deployments reference information from the study
##D head(getMovebank("deployment", login=login, study_id=studyID))
##D 
##D ## get the sensor measurements from the study
##D ## find out which sensors were used in this study
##D unique(getMovebankSensors(study=studyID,login=login)$sensor_type_id)
##D ## get movebank ID of one individual of this study
##D indID <- getMovebank("individual", login=login, study_id=studyID)$id[50]
##D ## the correspondence table between the individual ID and the 
##D ## animal names can be obtained like this
##D head(getMovebank("individual", login=login, 
##D 		 study_id=studyID)[, c("id", "local_identifier")])
##D 
##D ## get GPS and accelerometer data within a time period
##D ## create a vector with attributes for all sensors included in the study
##D attrib <- unique(c(as.character(getMovebankSensorsAttributes(studyID, 
##D 							     login=login)$short_name), 
##D 		   'sensor_type_id', 'deployment_id', 'event_id', 
##D 		   'individual_id', 'tag_id'))
##D ## get measurments for a given time period, in this case for GPS and 
##D ## accelerometer, and between "2013-06-25 03:55:00.000" and "2013-06-26 10:25:00.000"
##D getMovebank("event", login=login, study_id=studyID, sensor_type_id=c(653,2365683), 
##D 	    individual_id=indID, attributes=attrib, timestamp_start="20130625035500000", 
##D 	    timestamp_end="20130626102500000 ")
##D 
##D ## get all GPS data for 2 individuals
##D ## create a vector with attributes only for GPS data
##D attribs<-getMovebankSensorsAttributes(studyID, login)
##D attribGPS <- unique(c(as.character(attribs$short_name[attribs$sensor_type_id==653]), 
##D 		      'sensor_type_id', 'deployment_id', 'event_id', '
##D 		      individual_id', 'tag_id'))
##D indID2 <- getMovebank("individual", login=login, study_id=studyID)$id[35]
##D ## get GPS measurements for these two individuals
##D head(storks <- getMovebank("event", login=login, study_id=studyID, 
##D 			   sensor_type_id=653, individual_id=c(indID,indID2), 
##D 			   attributes=attribGPS))
##D 
##D ## create moveStack
##D ## get the names of the individuals as they appear on Movebank
##D (individualNames <- getMovebank("individual", login=login, 
##D 				study_id=studyID)[c(35,50), c("id", "local_identifier")])
##D head(storks2 <- merge(storks,individualNames,by.x="individual_id", by.y="id"))
##D 
##D myMoveStack <- move(x=storks2$location_long, y=storks2$location_lat,
##D 		    time=as.POSIXct(storks2$timestamp, format="%Y-%m-%d %H:%M:%S", tz="UTC"),
##D 		    data=storks2, 
##D 		    proj=CRS("+proj=longlat +ellps=WGS84"), 
##D 		    animal=storks2$local_identifier)
##D 
##D plot(myMoveStack, type="l")
## End(Not run)



