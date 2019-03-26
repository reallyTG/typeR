library(R.matlab)


### Name: Matlab
### Title: MATLAB client for remote or local MATLAB access
### Aliases: Matlab
### Keywords: classes

### ** Examples
## Not run: 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # This example will try to start the MATLAB server on the local machine,
##D # and then setup a Matlab object in R for communicating data between R
##D # and MATLAB and for sending commands from R to MATLAB.
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # 1.  Load R.matlab
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D library(R.matlab)
##D 
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # 2.  Start MATLAB
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # 2.1.  Start MATLAB from R?
##D # Start MATLAB server on the local machine (if this fails,
##D # see help(Matlab) for alternatives).
##D Matlab$startServer()
##D 
##D # 2.2.  OR start MATLAB externally,
##D #       THEN add 'externals' subdirectory to the MATLAB path
##D 
##D #  (Where is the 'externals' subdirectory?)
##D print(system.file("externals", package = "R.matlab"))
##D 
##D #       THEN from within MATLAB,
##D #            issue MATLAB command "MatlabServer"
##D # Note: If issued from a MATLAB command line, this last command
##D #       prevents further MATLAB 'command line' input
##D #       until something like close(matlab) at the end of this script
##D 
##D # 2.3.  If both these options fail, see help(Matlab) for alternatives.
##D 
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # 3. Create a MATLAB client object used to communicate with MATLAB
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D matlab <- Matlab()
##D 
##D # 3.1 Check status of MATLAB connection (not yet connected)
##D print(matlab)
##D 
##D # 3.2 If you experience any problems, ask for detailed outputs
##D #     by uncommenting the next line
##D # setVerbose(matlab, -2)
##D 
##D # 3.3 Connect to the MATLAB server.
##D isOpen <- open(matlab)
##D 
##D # 3.4 Confirm that the MATLAB server is open, and running
##D if (!isOpen)
##D   throw("MATLAB server is not running: waited 30 seconds.")
##D 
##D # 3.5 Check status of MATLAB connection (now connected)
##D print(matlab)
##D 
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # 4.  Sample uses of the MATLAB server
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # 4.1 Run MATLAB expressions on the MATLAB server
##D evaluate(matlab, "A = 1+2;", "B = ones(2, 20);")
##D 
##D # 4.2 Ask MATLAB to display a value (without transferring it to R)
##D evaluate(matlab, "A")
##D 
##D # 4.3 Get MATLAB variables
##D data <- getVariable(matlab, c("A", "B"))
##D cat("Received variables:\n")
##D str(data)
##D 
##D # 4.4 Set variables in MATLAB
##D ABCD <- matrix(rnorm(10000), ncol = 100)
##D str(ABCD)
##D setVariable(matlab, ABCD = ABCD)
##D 
##D # 4.5 Retrieve what we just set
##D data <- getVariable(matlab, "ABCD")
##D cat("Received variables:\n")
##D str(data)
##D 
##D # 4.6 Create a function (M-file) on the MATLAB server
##D setFunction(matlab, "            \
##D   function [win, aver] = dice(B) \
##D   %Play the dice game B times    \
##D   gains = [-1, 2, -3, 4, -5, 6]; \
##D   plays = unidrnd(6, B, 1);      \
##D   win = sum(gains(plays));       \
##D   aver = win/B;                  \
##D ")
##D 
##D # 4.7 Use the MATLAB function just created
##D evaluate(matlab, "[w, a] = dice(1000);")
##D res <- getVariable(matlab, c("w", "a"))
##D print(res)
##D 
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # 5. Exception handling
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # 5.1 Try to get non-existing MATLAB variable
##D #     (will result in an informative error)
##D tryCatch({
##D   data <- getVariable(matlab, "unknown")
##D   cat("Received variables:\n")
##D   str(data)
##D }, error = function(ex) {
##D   print(ex)
##D })
##D # Confirm that things still work
##D data <- getVariable(matlab, "A")
##D cat("Received variables:\n")
##D str(data)
##D 
##D 
##D # 5.2 Try to evaluate a MATLAB expression that fails
##D #     (will result in an informative error)
##D tryCatch({
##D   res <- evaluate(matlab, "C = 1+unknown;")
##D   res
##D }, error = function(ex) {
##D   print(ex)
##D })
##D # Confirm that things still work
##D res <- evaluate(matlab, "C = 1+2;")
##D print(res)
##D data <- getVariable(matlab, "C")
##D cat("Received variables:\n")
##D str(data)
##D 
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # 6.  Done:  close the MATLAB client
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # When done, close the MATLAB client, which will also shutdown
##D # the MATLAB server and the connection to it.
##D close(matlab)
##D 
##D # 6.1 Check status of MATLAB connection (now disconnected)
##D print(matlab)
## End(Not run)


