library(Hmisc)


### Name: data.frame.create.modify.check
### Title: Tips for Creating, Modifying, and Checking Data Frames
### Aliases: data.frame.create.modify.check
### Keywords: data manip programming interface htest

### ** Examples

## Not run: 
##D # First, we do steps that create or manipulate the data
##D # frame in its entirety.  For S-Plus, these are done with
##D # .Data in search position one (the default at the
##D # start of the session).
##D #
##D # -----------------------------------------------------------------------
##D # Step 1: Create initial draft of data frame
##D # 
##D # We usually begin by importing a dataset from
##D # # another application.  ASCII files may be imported
##D # using the scan and read.table functions.  SAS
##D # datasets may be imported using the Hmisc sas.get
##D # function (which will carry more attributes from
##D # SAS than using File ...  Import) from the GUI
##D # menus.  But for most applications (especially
##D # Excel), File ... Import will suffice.  If using
##D # the GUI, it is often best to provide variable
##D # names during the import process, using the Options
##D # tab, rather than renaming all fields later Of
##D # course, if the data to be imported already have
##D # field names (e.g., in Excel), let S use those
##D # automatically.  If using S-Plus, you can use a
##D # command to execute File ...  Import, e.g.:
##D 
##D 
##D import.data(FileName = "/windows/temp/fev.asc",
##D             FileType = "ASCII", DataFrame = "FEV")
##D 
##D 
##D # Here we name the new data frame FEV rather than
##D # fev, because we wanted to distinguish a variable
##D # in the data frame named fev from the data frame
##D # name.  For S-Plus the command will look
##D # instead like the following:
##D 
##D 
##D FEV <- importData("/tmp/fev.asc")
##D 
##D 
##D 
##D 
##D # -----------------------------------------------------------------------
##D # Step 2: Clean up data frame / make it be more
##D # efficiently stored
##D # 
##D # Unless using sas.get to import your dataset
##D # (sas.get already stores data efficiently), it is
##D # usually a good idea to run the data frame through
##D # the Hmisc cleanup.import function to change
##D # numeric variables that are always whole numbers to
##D # be stored as integers, the remaining numerics to
##D # single precision, strange values from Excel to
##D # NAs, and character variables that always contain
##D # legal numeric values to numeric variables.
##D # cleanup.import typically halves the size of the
##D # data frame.  If you do not specify any parameters
##D # to cleanup.import, the function assumes that no
##D # numeric variable needs more than 7 significant
##D # digits of precision, so all non-integer-valued
##D # variables will be converted to single precision.
##D 
##D 
##D FEV <- cleanup.import(FEV)
##D 
##D 
##D 
##D 
##D # -----------------------------------------------------------------------
##D # Step 3: Make global changes to the data frame
##D # 
##D # A data frame has attributes that are "external" to
##D # its variables.  There are the vector of its
##D # variable names ("names" attribute), the
##D # observation identifiers ("row.names"), and the
##D # "class" (whose value is "data.frame").  The
##D # "names" attribute is the one most commonly in need
##D # of modification.  If we had wanted to change all
##D # the variable names to lower case, we could have
##D # specified lowernames=TRUE to the cleanup.import
##D # invocation above, or type
##D 
##D 
##D names(FEV) <- casefold(names(FEV))
##D 
##D 
##D # The upData function can also be used to change
##D # variable names in two ways (see below).
##D # To change names in a non-systematic way we use
##D # other options.  Under Windows/NT the most
##D # straigtforward approach is to change the names
##D # interactively.  Click on the data frame in the
##D # left panel of the Object Browser, then in the
##D # right pane click twice (slowly) on a variable.
##D # Use the left arrow and other keys to edit the
##D # name.  Click outside that name field to commit the
##D # change.  You can also rename columns while in a
##D # Data Sheet.  To instead use programming commands
##D # to change names, use something like:
##D 
##D 
##D names(FEV)[6] <- 'smoke'   # assumes you know the positions!  
##D names(FEV)[names(FEV)=='smoking'] <- 'smoke' 
##D names(FEV) <- edit(names(FEV))
##D 
##D 
##D # The last example is useful if you are changing
##D # many names.  But none of the interactive
##D # approaches such as edit() are handy if you will be
##D # re-importing the dataset after it is updated in
##D # its original application.  This problem can be
##D # addressed by saving the new names in a permanent
##D # vector in .Data:
##D 
##D 
##D new.names <- names(FEV)
##D 
##D 
##D # Then if the data are re-imported, you can type
##D 
##D 
##D names(FEV) <- new.names
##D 
##D 
##D # to rename the variables.
##D 
##D 
##D 
##D 
##D # -----------------------------------------------------------------------
##D # Step 4: Delete unneeded variables
##D # 
##D # To delete some of the variables, you can
##D # right-click on variable names in the Object
##D # Browser's right pane, then select Delete.  You can
##D # also set variables to have NULL values, which
##D # causes the system to delete them.  We don't need
##D # to delete any variables from FEV but suppose we
##D # did need to delete some from mydframe.
##D 
##D 
##D mydframe$x1 <- NULL 
##D mydframe$x2 <- NULL
##D mydframe[c('age','sex')] <- NULL   # delete 2 variables 
##D mydframe[Cs(age,sex)]    <- NULL   # same thing
##D 
##D 
##D # The last example uses the Hmisc short-cut quoting
##D # function Cs.  See also the drop parameter to upData.
##D 
##D 
##D 
##D 
##D # -----------------------------------------------------------------------
##D # Step 5: Make changes to individual variables
##D #         within the data frame
##D # 
##D # After importing data, the resulting variables are
##D # seldom self - documenting, so we commonly need to
##D # change or enhance attributes of individual
##D # variables within the data frame.
##D # 
##D # If you are only changing a few variables, it is
##D # efficient to change them directly without
##D # attaching the entire data frame.
##D 
##D 
##D FEV$sex   <- factor(FEV$sex,   0:1, c('female','male')) 
##D FEV$smoke <- factor(FEV$smoke, 0:1, 
##D                     c('non-current smoker','current smoker')) 
##D units(FEV$age)    <- 'years'
##D units(FEV$fev)    <- 'L' 
##D label(FEV$fev)    <- 'Forced Expiratory Volume' 
##D units(FEV$height) <- 'inches'
##D 
##D 
##D # When changing more than one or two variables it is
##D # more convenient change the data frame using the
##D # Hmisc upData function.
##D 
##D 
##D FEV2 <- upData(FEV,
##D   rename=c(smoking='smoke'), 
##D   # omit if renamed above
##D   drop=c('var1','var2'),
##D   levels=list(sex  =list(female=0,male=1),
##D               smoke=list('non-current smoker'=0,
##D                          'current smoker'=1)),
##D   units=list(age='years', fev='L', height='inches'),
##D   labels=list(fev='Forced Expiratory Volume'))
##D 
##D 
##D # An alternative to levels=list(...) is for example
##D # upData(FEV, sex=factor(sex,0:1,c('female','male'))).
##D # 
##D # Note that we saved the changed data frame into a
##D # new data frame FEV2.  If we were confident of the
##D # correctness of our changes we could have stored
##D # the new data frame on top of the old one, under
##D # the original name FEV.
##D 
##D 
##D # -----------------------------------------------------------------------
##D # Step 6:  Check the data frame
##D # 
##D # The Hmisc describe function is perhaps the first
##D # function that should be used on the new data
##D # frame.  It provides documentation of all the
##D # variables and the frequency tabulation, counts of
##D # NAs,  and 5 largest and smallest values are
##D # helpful in detecting data errors.  Typing
##D # describe(FEV) will write the results to the
##D # current output window.  To put the results in a
##D # new window that can persist, even upon exiting
##D # S, we use the page function.  The describe
##D # output can be minimized to an icon but kept ready
##D # for guiding later steps of the analysis.
##D 
##D 
##D page(describe(FEV2), multi=TRUE) 
##D # multi=TRUE allows that window to persist while
##D # control is returned to other windows
##D 
##D 
##D # The new data frame is OK.  Store it on top of the
##D # old FEV and then use the graphical user interface
##D # to delete FEV2 (click on it and hit the Delete
##D # key) or type rm(FEV2) after the next statement.
##D 
##D 
##D FEV <- FEV2
##D 
##D 
##D # Next, we can use a variety of other functions to
##D # check and describe all of the variables.  As we
##D # are analyzing all or almost all of the variables,
##D # this is best done without attaching the data
##D # frame.  Note that plot.data.frame plots inverted
##D # CDFs for continuous variables and dot plots
##D # showing frequency distributions of categorical
##D # ones.
##D 
##D 
##D summary(FEV)
##D # basic summary function (summary.data.frame) 
##D 
##D 
##D plot(FEV)                # plot.data.frame 
##D datadensity(FEV)         
##D # rug plots and freq. bar charts for all var.
##D 
##D 
##D hist.data.frame(FEV)     
##D # for variables having > 2 values 
##D 
##D 
##D by(FEV, FEV$smoke, summary)  
##D # use basic summary function with stratification
##D 
##D 
##D 
##D 
##D # -----------------------------------------------------------------------
##D # Step 7:  Do detailed analyses involving individual
##D #          variables
##D # 
##D # Analyses based on the formula language can use
##D # data= so attaching the data frame may not be
##D # required.  This saves memory.  Here we use the
##D # Hmisc summary.formula function to compute 5
##D # statistics on height, stratified separately by age
##D # quartile and by sex.
##D 
##D 
##D options(width=80) 
##D summary(height ~ age + sex, data=FEV,
##D         fun=function(y)c(smean.sd(y),
##D                          smedian.hilow(y,conf.int=.5)))
##D # This computes mean height, S.D., median, outer quartiles
##D 
##D 
##D fit <- lm(height ~ age*sex, data=FEV) 
##D summary(fit)
##D 
##D 
##D # For this analysis we could also have attached the
##D # data frame in search position 2.  For other
##D # analyses, it is mandatory to attach the data frame
##D # unless FEV$ prefixes each variable name.
##D # Important: DO NOT USE attach(FEV, 1) or
##D # attach(FEV, pos=1, ...) if you are only analyzing
##D # and not changing the variables, unless you really
##D # need to avoid conflicts with variables in search
##D # position 1 that have the same names as the
##D # variables in FEV.  Attaching into search position
##D # 1 will cause S-Plus to be more of a memory hog.
##D 
##D 
##D attach(FEV)
##D # Use e.g. attach(FEV[,Cs(age,sex)]) if you only
##D # want to analyze a small subset of the variables
##D # Use e.g. attach(FEV[FEV$sex=='male',]) to
##D # analyze a subset of the observations
##D 
##D 
##D summary(height ~ age + sex,
##D         fun=function(y)c(smean.sd(y),
##D           smedian.hilow(y,conf.int=.5)))
##D fit <- lm(height ~ age*sex)
##D 
##D 
##D # Run generic summary function on height and fev, 
##D # stratified by sex
##D by(data.frame(height,fev), sex, summary)
##D 
##D 
##D # Cross-classify into 4 sex x smoke groups
##D by(FEV, list(sex,smoke), summary)
##D 
##D 
##D # Plot 5 quantiles
##D s <- summary(fev ~ age + sex + height,
##D               fun=function(y)quantile(y,c(.1,.25,.5,.75,.9)))
##D 
##D 
##D plot(s, which=1:5, pch=c(1,2,15,2,1), #pch=c('=','[','o',']','='), 
##D      main='A Discovery', xlab='FEV')
##D 
##D 
##D # Use the nonparametric bootstrap to compute a 
##D # 0.95 confidence interval for the population mean fev
##D smean.cl.boot(fev)    # in Hmisc
##D 
##D 
##D # Use the Statistics ... Compare Samples ... One Sample 
##D # keys to get a normal-theory-based C.I.  Then do it 
##D # more manually.  The following method assumes that 
##D # there are no NAs in fev
##D 
##D 
##D sd <- sqrt(var(fev))
##D xbar <- mean(fev)
##D xbar
##D sd
##D n <- length(fev)
##D qt(.975,n-1)     
##D # prints 0.975 critical value of t dist. with n-1 d.f.
##D 
##D 
##D xbar + c(-1,1)*sd/sqrt(n)*qt(.975,n-1)   
##D # prints confidence limits
##D 
##D 
##D # Fit a linear model
##D # fit <- lm(fev ~ other variables ...)
##D 
##D 
##D detach()
##D 
##D 
##D # The last command is only needed if you want to
##D # start operating on another data frame and you want
##D # to get FEV out of the way.
##D 
##D 
##D 
##D 
##D # -----------------------------------------------------------------------
##D # Creating data frames from scratch
##D # 
##D # Data frames can be created from within S.  To
##D # create a small data frame containing ordinary
##D # data, you can use something like
##D 
##D 
##D dframe <- data.frame(age=c(10,20,30), 
##D                      sex=c('male','female','male'))
##D 
##D 
##D # You can also create a data frame using the Data
##D # Sheet.  Create an empty data frame with the
##D # correct variable names and types, then edit in the
##D # data.
##D 
##D 
##D dd <- data.frame(age=numeric(0),sex=character(0))
##D 
##D 
##D # The sex variable will be stored as a factor, and
##D # levels will be automatically added to it as you
##D # define new values for sex in the Data Sheet's sex
##D # column.
##D # 
##D # When the data frame you need to create is defined
##D # by systematically varying variables (e.g., all
##D # possible combinations of values of each variable),
##D # the expand.grid function is useful for quickly
##D # creating the data.  Then you can add
##D # non-systematically-varying variables to the object
##D # created by expand.grid, using programming
##D # statements or editing the Data Sheet.  This
##D # process is useful for creating a data frame
##D # representing all the values in a printed table.
##D # In what follows we create a data frame
##D # representing the combinations of values from an 8
##D # x 2 x 2 x 2 (event x method x sex x what) table,
##D # and add a non-systematic variable percent to the
##D # data.
##D 
##D 
##D jcetable <- expand.grid(
##D  event=c('Wheezing at any time',
##D          'Wheezing and breathless',
##D          'Wheezing without a cold',
##D          'Waking with tightness in the chest',
##D          'Waking with shortness of breath',
##D          'Waking with an attack of cough',
##D          'Attack of asthma',
##D          'Use of medication'),
##D  method=c('Mail','Telephone'), 
##D  sex=c('Male','Female'),
##D  what=c('Sensitivity','Specificity'))
##D 
##D 
##D jcetable$percent <- 
##D c(756,618,706,422,356,578,289,333,
##D   576,421,789,273,273,212,212,212,
##D   613,763,713,403,377,541,290,226,
##D   613,684,632,290,387,613,258,129,
##D   656,597,438,780,732,679,938,919,
##D   714,600,494,877,850,703,963,987,
##D   755,420,480,794,779,647,956,941,
##D   766,423,500,833,833,604,955,986) / 10
##D 
##D 
##D # In jcetable, event varies most rapidly, then
##D # method, then sex, and what.
## End(Not run)



