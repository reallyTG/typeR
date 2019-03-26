library(esmprep)


### Name: esmprep
### Title: esmprep: A package for preparing raw data in research that uses
###   the Experience-Sampling-Methodology (ESM).
### Aliases: esmprep esmprep-package

### ** Examples

## Not run: 
##D # -o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-
##D # N O T E.
##D # DEAR USER OF THE 'esmprep' PACKAGE,
##D # THE FOLLOWING CODE IS AN EXAMPLE OF ALL THE PACKAGES'S FUNCTIONS, WHICH ARE
##D # LARGELY INTERDEPENDENT AND WHICH ARE SUPPOSED TO RUN IN AN HIERARCHICAL ORDER.
##D # AFTER HAVING LOADED THE PACKAGE YOU CAN COPY PASTE THE ENTIRE CODE INTO YOUR
##D # CONSOLE OR INTO A SCRIPT AND THEN RUN IT.
##D # -o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-
##D # ---------------------------------------------------------------------------------
##D # Load the 'esmprep' package => library(esmprep)
##D # ---------------------------------------------------------------------------------
##D # FUNCTION  NAME: relevantREFVN
##D # --------------
##D # Don't run independently. Run function 1 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # With date and time as separate arguments
##D relRef <- relevantREFVN(ID="id", IMEI="imei", ST="st",
##D STARTDATE="start_date", STARTTIME="start_time",
##D ENDDATE="end_date", ENDTIME="end_time")
##D # # DON'T RUN, because the example data doesn't contain date-time objects.
##D # # With date-time objects instead of separate date and time
##D # relRef <- relevantREFVN(ID="id", IMEI="imei", ST="st",
##D # START_DATETIME="start_dateTime", END_DATETIME="end_dateTime")
##D # ---------------------------------------------------------------------------------
##D # FUNCTION  NAME: setREF
##D # --------------
##D # Don't run independently. Run function 2 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # 4 is the number of daily prompts.
##D # relRef is the result of function 'relevantREFVN'
##D # Relevant variables names of reference dataset.
##D RELEVANTVN_REF <- setREF(4, relRef)
##D # ---------------------------------------------------------------------------------
##D # FUNCTION  NAME: relevantESVN
##D # --------------
##D # Don't run independently. Run function 3 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # With date and time as separate arguments
##D relEs <- relevantESVN(svyName="survey_name", IMEI="IMEI",
##D STARTDATE="start_date", STARTTIME="start_time",
##D ENDDATE="end_date", ENDTIME="end_time")
##D # # DON'T RUN, because the example data doesn't contain date-time objects.
##D # # With date-time objects instead of separate date and time
##D # relEs <- relevantESVN(svyName="survey_name", IMEI="IMEI",
##D # START_DATETIME="start_dateTime", END_DATETIME="end_dateTime")
##D # ---------------------------------------------------------------------------------
##D # FUNCTION  NAME: setES
##D # --------------
##D # Don't run independently. Run function 4 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # imeiNumbers is the vector containing all IMEI numbers used in
##D # the ESM study; use the respective entries in the referenceDf.
##D imeiNumbers <- as.character(referenceDf$imei)
##D # surveyNames is the vector containing all ESM version names.
##D surveyNames <- c(
##D # Test group
##D    "morningTestGroup", "dayTestGroup", "eveningTestGroup",
##D # Control group
##D    "morningControlGroup", "dayControlGroup", "eveningControlGroup")
##D # 4 is the number of daily prompts
##D # relEs is the result of function 'relevantESVN'
##D RELEVANT_ES <- setES(4, imeiNumbers, surveyNames, relEs)
##D 
##D # Extract relevant ESM general information
##D RELEVANTINFO_ES <- RELEVANT_ES[["RELEVANTINFO_ES"]]
##D 
##D # Extract list of relevant variables names of raw ESM datasets.
##D RELEVANTVN_ES <- RELEVANT_ES[["RELEVANTVN_ES"]]
##D # ---------------------------------------------------------------------------------
##D # FUNCTION  NAME: esList
##D # --------------
##D # Don't run independently. Run function 5 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # 6 exemplary raw ESM (sub-)datasets.
##D esLs <- esList(list(morningControl, dayControl, eveningControl,
##D morningTest, dayTest, eveningTest), RELEVANTVN_ES)
##D # ---------------------------------------------------------------------------------
##D # FUNCTION  NAME: genKey
##D # --------------
##D # Don't run independently. Run function 6 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # esLs is the result of function 'esList'.
##D keyLs <- genKey(esLs)
##D # ---------------------------------------------------------------------------------
##D # FUNCTION  NAME: genDateTime
##D # --------------
##D # Don't run independently. Run function 7 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # Applying function to reference dataset (7a of 28)
##D referenceDfList <- genDateTime(referenceDf, "REF", RELEVANTINFO_ES, RELEVANTVN_ES,
##D RELEVANTVN_REF)
##D 
##D # Extract reference dataset from output
##D referenceDfNew <- referenceDfList[["refOrEsDf"]]
##D names(referenceDfNew)
##D 
##D # Extract extended list of relevant variables names of reference dataset
##D RELEVANTVN_REF <- referenceDfList[["extendedVNList"]]
##D 
##D # Applying function to raw ESM dataset(s) (7b of 28)
##D # keyLs is the result of function 'genKey'.
##D keyList <- genDateTime(keyLs, "ES", RELEVANTINFO_ES, RELEVANTVN_ES,
##D RELEVANTVN_REF)
##D 
##D # Extract list of raw ESM datasets from output
##D keyLsNew <- keyList[["refOrEsDf"]]
##D 
##D # Extract extended list of relevant variables names of raw ESM datasets
##D RELEVANTVN_ES <- keyList[["extendedVNList"]]
##D # ---------------------------------------------------------------------------------
##D # FUNCTION  NAME: rmInvalid
##D # --------------
##D # Don't run independently. Run function 8 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # keyLsNew is the result of function 'genDateTime' (or of function 'splitDateTime').
##D rmInvLs <- rmInvalid(keyLsNew, RELEVANTVN_ES)
##D # Result of function 'rmInvalid' is a list with 4 elements:
##D names(rmInvLs)
##D # ---------------------------------------------------------------------------------
##D # FUNCTION  NAME: printRmInvalid
##D # --------------
##D # Don't run independently. Run function 9 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # rmInvLs is the result of function 'rmInvalid'. Display its result
##D # in the console both tablulated and in detail.
##D key_rmLs <- printRmInvalid(rmInvLs, smr="both", RELEVANTVN_ES)
##D # Display the list containing the KEY values of all questionnaires
##D # that have been removed.
##D key_rmLs
##D # Since there have been warning messages in 4 of the 6 datasets,
##D # the first ESM item (name: V1) was automatically converted to class
##D # character, although it is numeric. So we'll re-convert V1's class.
##D # Check V1 prior to conversion
##D str(rmInvLs[["dfValid"]][[2]][1:2])
##D rmInvLs[["dfValid"]] <- sapply(rmInvLs[["dfValid"]], function(x) {
##D      x[,"V1"] <- as.numeric(x[,"V1"])
##D      return(x) })
##D # Check V1 after conversion
##D str(rmInvLs[["dfValid"]][[2]][1:2])
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: esItems
##D # --------------
##D # Don't run independently. Run function 10 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # Extract the item names of the raw ESM datasets. rmInvLs[["dfValid"]]
##D # is one of the results from function 'rmInvalid'
##D plausibItems <- esItems(dfList=rmInvLs[["dfValid"]], RELEVANTVN_ES)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: esPlausible
##D # --------------
##D # Don't run independently. Run function 11 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # Help checking the plausibility of items in the raw ESM datasets. rmInvLs[["dfValid"]]
##D # is one of the results from function 'rmInvalid'.
##D # plausibItems is the result of function 'esItems'.
##D plausibLs <- esPlausible(dfList=rmInvLs[["dfValid"]], itemVecList=plausibItems)
##D # Display the results (4 data frames) to the console
##D # plausibNames gives an overview of the item names across all ESM versions
##D plausibLs[["plausibNames"]]
##D # plausibClass gives an overview of the variable types of all items
##D plausibLs[["plausibClass"]]
##D # plausibRowNa shows for each ESM version the number of lines in the raw
##D # ESM datasets and how much percent of the data is missing (NAs).
##D plausibLs[["plausibRowNa"]]
##D # plausibMinMax shows for each numeric variable the minimum and maximum.
##D plausibLs[["plausibMinMax"]]
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: esComplete
##D # --------------
##D # Don't run independently. Run function 12 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # Generate second argument of function 'esComplete'. It's strongly recommended
##D # to read the explantion of this 2nd argument in the 'esmprep' vignette, function
##D # 'esComplete'.
##D lastItemList <- list(
##D # If in survey version "morningTestGroup" variable "V6" contains the value 0,
##D # then variable "V6_1" is the last item expected to contain data, else "V6" is the last item
##D # expected to contain data.
##D list("morningTestGroup", "V6", 0, "V6_1"),
##D # In survey version "dayTestGroup" variable "V7" is the last item expected to contain data;
##D # unlike above, no conditions; NA as 2nd and 3rd element of the inner list are mandatory.
##D list("dayTestGroup", NA, NA, "V7"),
##D # Information of all further ESM versions are passed accordingly:
##D list("eveningTestGroup", "V9", 1, "V9_1"),
##D list("morningControlGroup", "V6", 0, "V6_1"),
##D list("dayControlGroup", NA, NA, "V7"),
##D # The last ESM version has 2 conditions, therefore it is passed 2 times:
##D # If V8_1 contains a value between 1 and 5, then V8_3 is the last item expected to
##D # contain data.
##D list("eveningControlGroup", "V8_1", 1:5, "V8_3"),
##D # If V8_1 contains the value 0, then V8_2 is the last item expected to contain data.
##D list("eveningControlGroup", "V8_1", 0, "V8_2"))
##D # Apply function 'esComplete'. rmInvLs[["dfValid"]] is one of the results of function
##D # rmInvalid.
##D isCompleteLs <- esComplete(rmInvLs[["dfValid"]], lastItemList)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: esMerge
##D # --------------
##D # Don't run independently. Run function 13 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # Merge all raw ESM datasets. isCompleteLs is the result
##D # of function 'esComplete'.
##D esMerged <- esMerge(isCompleteLs, RELEVANTVN_ES)
##D # If preferred convert the 15 digit IMEI number from scientfic notation to text.
##D esMerged[,RELEVANTVN_ES[["ES_IMEI"]]] <- as.character(esMerged[,RELEVANTVN_ES[["ES_IMEI"]]])
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: findChars
##D # --------------
##D # Don't run independently. Run function 14 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # esMerged is the result of function 'esMerge'
##D findTextIdx <- findChars(esMerged)
##D # Display structure of function output
##D str(findTextIdx)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: convertChars
##D # --------------
##D # Don't run independently. Run function 15 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # From result of function 'findChars' select the indices of the items
##D # in the ESM dataset that contain text answers of the participants.
##D findTextIdx1 <- findTextIdx[c(1,2,9,10)]
##D # Use findTextIdx1 to generate the 3rd argument of function 'convertChars'.
##D textColumns <- names(findTextIdx1)
##D # Generate data.frame specifying the conversion of single characters.
##D # Since R doesn't permit umlauts (non-ASCII characters) to be contained in datasets,
##D # which are attached to a package, this function cannot be presented the way it was
##D # intended, i.e. in the exemplary datasets there are no umlauts (non-ASCII characters), 
##D # therefore nothing REALLY gets converted. However, the function aims at converting
##D # troublesome characters, like umlauts, to less troublesome alternatives.
##D convertCharsDf <- data.frame(c("ä", "ü"), c("ae", "ue"))
##D # Apply function. esMerged is the result of function 'esMerge'.
##D esMerged1 <- convertChars(esMerged, textColumns, convertCharsDf)
##D # # As default upper and lower case are NOT ignored! If you want them
##D # # ignored, additionally pass TRUE to the argument ignoreCase, like this:
##D # convertChars(esMerged, textColumns, convertCharsDf, ignoreCase=TRUE)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: esAssign
##D # --------------
##D # Don't run independently. Run function 16 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # Assign questionnaires contained in the raw ESM dataset to all participants listed
##D # in the reference dataset. esMerged1 is the result of function 'convertChars',
##D # referenceDfNew is the result of function 'genDateTime' or of function
##D # 'splitDateTime'.
##D esAssigned <- esAssign(esDf = esMerged1, refDf = referenceDfNew, RELEVANTINFO_ES,
##D RELEVANTVN_ES, RELEVANTVN_REF)
##D # Assign questionnaires contained in the raw ESM dataset to participant P001 listed
##D # in the reference dataset.
##D # # DON'T RUN, unless you want to see the output solely for participant P001.
##D # esAssigned <- esAssign(esDf = esMerged1, refDf = referenceDfNew, RELEVANTINFO_ES,
##D # RELEVANTVN_ES, RELEVANTVN_REF, singlePerson="P001")
##D # More options can be passed to 'esAssign', see parameter description. Note that when
##D # setting the argument midnightPrompt to TRUE, esAssign takes a bit longer to do its job.
##D # Output: List with 4 data.frames.
##D names(esAssigned)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: missingEndDateTime
##D # --------------
##D # Don't run independently. Run function 17 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # esAssigned[["ES"]] is one of the results of function 'esAssign'.
##D noEndDf <- missingEndDateTime(esAssigned[["ES"]], RELEVANTVN_ES)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: relevantREFVN
##D # --------------
##D # Don't run independently. Run function 18 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # noEndDf is the result of function 'noEndDateTime'.
##D identDf <- esIdentical(noEndDf, RELEVANTVN_ES)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: suggestShift
##D # --------------
##D # Don't run independently. Run function 19 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # identDf is the result of function 'esIdentical'.
##D # 100 represents the number of minutes that at least must have passed
##D # between the scheduled start of an ESM questionnaire at its actual start
##D # in order for the questionnaire to be eligible for shifting (see function
##D # makeShift).
##D sugShift <- suggestShift(identDf, 100, RELEVANTINFO_ES, RELEVANTVN_ES)
##D # Display output element 'suggestShiftDf':
##D sugShift$suggestShiftDf
##D # Display output element 'printShiftDf':
##D sugShift$printShiftDf
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: printSuggestedShift
##D # --------------
##D # Don't run independently. Run function 20 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # Display the result of function 'suggestShift' in the console.
##D printSuggestedShift(sugShift, RELEVANTVN_ES)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: makeShift
##D # --------------
##D # Don't run independently. Run function 21 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # sugShift is the result of function 'suggestShift'. referenceDfNew is the result
##D # of function 'genDateTime' or of function 'splitDateTime'.
##D # keyPromptDf is generated by using part of the output of function suggestShift,
##D # i.e. by selecting the columns NEW_PROMPT and SHIFTKEY from suggestShiftDf.
##D keyPromptDf <- sugShift$suggestShiftDf[,c("NEW_PROMPT", "SHIFTKEY")]
##D madeShift <- makeShift(sugShift, referenceDfNew, keyPromptDf, RELEVANTINFO_ES, RELEVANTVN_REF)
##D # Tip! Display the result of function 'makeShift' in the console
##D # in order to check whether the shifting was successful.
##D printSuggestedShift(madeShift, RELEVANTVN_ES)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: expectedPromptIndex
##D # --------------
##D # Don't run independently. Run function 22 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # Generate second argument of function 'expectedPromptIndex'. It's strongly
##D # recommended to read the explanation of this 2nd argument in the 'esmprep'
##D # vignette, function 'expectedPromptIndex'.
##D expIdxList <- list(
##D # I - the user - expect in the ESM version morningTestGroup that
##D # prompt no.1 is always linked to the value 1.
##D list("morningTestGroup", 1, 1),
##D # I - the user - expect in the ESM version dayTestGroup that
##D # prompt no. 2 and no.3 are always linked to the value 2.
##D list("dayTestGroup", c(2, 3), 2),
##D # Information of all further ESM versions are passed accordingly:
##D list("eveningTestGroup", 4, 3),
##D list("morningControlGroup", 1, 1),
##D list("dayControlGroup", c(2,3), 2),
##D list("eveningControlGroup", 4, 3))
##D # madeShiftDf$esDf is part of the output of function 'makeShift', if at
##D # least one questionnaire was shifted to a neighboring prompt index.
##D expectedDf <- expectedPromptIndex(madeShift$esDf, expIdxList, RELEVANTINFO_ES,
##D RELEVANTVN_ES)
##D # If no questionnaire is suggested for shifting (see function suggestShift)
##D # simply use the result of function suggestShift as 1st argument.
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: intolerable
##D # --------------
##D # Don't run independently. Run function 23 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # Generate second argument of function 'intolerable'
##D (intoleranceDf <- data.frame(
##D # Column 'prompt': Prompts that must NEVER be comined with expected categories.
##D prompt = c(2, 3, 4, 1, 1),
##D # Column 'expect': Expected categories that must NEVER be combined with the prompts.
##D expect = c(1, 1, 1, 2, 3)))
##D # Read: Prompts 2, 3, and 4 must never be combined with expected category 1.
##D # Read: Prompt 1 must never be combined with expected category 2.
##D # Read: Prompt 1 must never be combined with expected category 3.
##D # expectedDf is the result of function 'expectedPromptIndex'.
##D intolLs <- intolerable(expectedDf, intoleranceDf, RELEVANTINFO_ES)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: randomMultSelection
##D # --------------
##D # Don't run independently. Run function 24 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # intolLs[["cleanedDf"]] is the result of function 'intolerable'.
##D randSelLs <- randomMultSelection(intolLs[["cleanedDf"]])
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: computeTimeLag
##D # --------------
##D # Don't run independently. Run function 25 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # randSelLs[["esRandSelIn"]] is the result of function 'randomMultSelection'.
##D lagDf <- computeTimeLag(randSelLs[["esRandSelIn"]], RELEVANTVN_ES)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: computeDuration
##D # --------------
##D # Don't run independently. Run function 26 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # lagDf is the result of function 'lagDf'.
##D durDf <- computeDuration(lagDf, RELEVANTVN_ES)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: computeTimeBetween
##D # --------------
##D # Don't run independently. Run function 27 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # durDf is the result of function 'computeDuration'.
##D tbsqDf <- computeTimeBetween(esDf = durDf, refDf = referenceDfNew, RELEVANTVN_ES,
##D RELEVANTVN_REF)
##D # ----------------------------------------------------------------------------------
##D # FUNCTION  NAME: esFinal
##D # --------------
##D # Don't run independently. Run function 28 of 28 in 'esmprep' functions' hierarchy.
##D # ------------------------
##D # tbsqDf is the result of function 'computeTimeBetween'.
##D esDfFin <- esFinal(tbsqDf, RELEVANTINFO_ES, RELEVANTVN_ES)
## End(Not run)



