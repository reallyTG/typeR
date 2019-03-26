library(ELT)


### Name: ELT-package
### Title: ELT - A package to build Experience Life Tables
### Aliases: ELT-package ELT
### Keywords: package

### ** Examples

## Not run: 
##D data(MyPortfolio)
##D data(ReferenceMale)
##D data(ReferenceFemale)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Initialize Age variables                                                ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D AgeRange <- 30:90
##D AgeCrit <- 30:90
##D AgeRef <- 30:95
##D 
##D History <- ReadHistory(MyPortfolio = MyPortfolio, DateBegObs = "1996/01/01",
##D DateEndObs = "2007/12/31", DateFormat = "##D 
##D 
##D MyData <- AddReference(History = History, ReferenceMale = ReferenceMale,
##D ReferenceFemale = ReferenceFemale)
##D 
##D ## ######################################################################## ##
##D ## METHOD 1 ############################################################### ##
##D ## ######################################################################## ##
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Execute method 1                                                        ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D OutputMethod1 <- Method1(MyData = MyData, AgeRange = AgeRange,  Plot = T)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Validate method 1 by the 1st level citeria                              ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute 1st level citeria.
##D 
##D ValidationLevel1Method1 <- ValidationLevel1(OutputMethod = OutputMethod1, MyData = MyData,
##D  AgeCrit = AgeCrit, ValCrit = 0.05, Plot = T, Excel = T)
##D 
##D ## ---------- If the criterions corresponding to the 1st level are not 
##D ## ---------- satisfied, we can modify the age range used to compute the SMR
##D ## ---------- and reexecute
##D ## ---------- OutputMethod1 <- Method1(...)
##D ## ---------- and
##D ## ---------- ValidationLevel1Method1 <- ValidationLevel1(...).
##D ## ---------- If the criterions corresponding to the 1st level are still not 
##D ## ---------- satisfied, we turn to the method 2, and it is useless to
##D ## ---------- pursue the completion of the table and the validation.
##D ## ---------- If the criterions are satisfied, we continue the validation with
##D ## ---------- the criterions corresponding to the 2nd level.
##D ## ---------- We can also turn to method 3 or 4 to improve the fit at a cost 
##D ## ---------- of a somewhat greeter complexity.
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Validate method 1 by the 2nd level citeria                              ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute 2nd level criterions
##D 
##D ValidationLevel2Method1 <- ValidationLevel2(OutputMethod = OutputMethod1, MyData = MyData,
##D  AgeCrit = AgeCrit, ValCrit = 0.05, Excel = T)
##D 
##D ## ---------- If the criterions corresponding to the 2nd level are not satisfied
##D ## ---------- we turn to the method 2 and it is useless to pursue the 
##D ## ---------- completion of the table and the validation.
##D ## ---------- If the criterions are satisfied, we continue the validation with
##D ## ---------- the completion of the table and the criterions corresponding to
##D ## ---------- the 3rd level.
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Completion Method 1                                                     ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Age range for the selection of the optimal starting age.
##D 
##D AgeRangeOptMale <- AgeRangeOptFemale <-  c(80, 80)
##D 
##D ## ---------- In theory, we could select the optimal starting age, however 
##D ## ---------- the optimal starting age can vary a lot with the calendar years
##D ## ---------- leading to a relatively irregular surface. In practice, we
##D ## ---------- select then a fixed age for the whole years.
##D 
##D ## ---------- Starting age for which the fitted probabilities of the death are
##D ## ---------- replaced by the values obtained from the completion model.
##D 
##D BegAgeCompMale <- BegAgeCompFemale <- 85
##D 
##D ## ---------- We check if the completion is smoothed with graphical
##D ## ---------- diagnostics.
##D 
##D CompletionMethod1 <- CompletionA(OutputMethod = OutputMethod1, MyData = MyData,
##D  AgeRangeOptMale = AgeRangeOptMale, AgeRangeOptFemale = AgeRangeOptFemale,
##D  BegAgeCompMale = BegAgeCompMale, BegAgeCompFemale = BegAgeCompFemale, ShowPlot = T)
##D 
##D ## ---------- If the completion is not satisfying, we modify the values
##D ## ---------- AgeRangeOpt and BegAgeComp, and we repeat the previous script
##D ## ---------- CompletionA()
##D ## ---------- If the completion is satisfying, we execute
##D 
##D FinalMethod1 <- CompletionB(ModCompletion = CompletionMethod1, OutputMethod = OutputMethod1,
##D  MyData = MyData, Plot = T, Excel = T)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Validate method 1 by the 3rd level citeria                              ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute 3rd level criterions
##D 
##D ValidationLevel3Method1 <- ValidationLevel3(FinalMethod = FinalMethod1, MyData = MyData,
##D  Plot = T, Excel = T)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Coef Varition, Conf int. and rel. disp. of fitted per. life exp.        ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Compute the coefficient of variation, confidence intervals and
##D ## ---------- relative dispersion of the fitted perdiodic life expectancies
##D 
##D DispersionMethod1 <- Dispersion(FinalMethod = FinalMethod1, MyData = MyData, Plot = T,NbSim = 10)
##D 
##D ## ######################################################################## ##
##D ## METHOD 2 ############################################################### ##
##D ## ######################################################################## ##
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Execute method 2                                                        ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D OutputMethod2 <- Method2(MyData = MyData, AgeRange = AgeRange, Plot = T)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Validate method 2 by the 1st level citeria                              ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute 1st level citeria.
##D 
##D ValidationLevel1Method2 <- ValidationLevel1(OutputMethod = OutputMethod2, MyData = MyData,
##D  AgeCrit = AgeCrit, ValCrit = 0.05, Plot = T, Excel = T)
##D 
##D ## ---------- If the criterions corresponding to the 1st level are not 
##D ## ---------- satisfied, we turn to the method 3, and it is useless to
##D ## ---------- pursue the completion of the table and the validation.
##D ## ---------- If the criterions are satisfied, we continue the validation with
##D ## ---------- the criterions corresponding to the 2nd level.
##D ## ---------- We can also turn to method 4 to improve the fit at a cost 
##D ## ---------- of a somewhat greeter complexity.
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Validate method 2 by the 2nd level citeria                              ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute 2nd level criterions
##D 
##D ValidationLevel2Method2 <- ValidationLevel2(OutputMethod = OutputMethod2, AgeCrit = AgeCrit,
##D  ValCrit = 0.05, MyData = MyData, Excel = T)
##D 
##D ## ---------- If the criterions corresponding to the 2nd level are not satisfied
##D ## ---------- we turn to the method 3 and it is useless to pursue the 
##D ## ---------- completion of the table and the validation.
##D ## ---------- If the criterions are satisfied, we continue the validation with
##D ## ---------- the completion of the table and the criterions corresponding to
##D ## ---------- the 3rd level.
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Completion Method 2                                                     ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- We check if the completion is smoothed with graphical
##D ## ---------- diqgnostics.
##D 
##D CompletionMethod2 <- CompletionA(OutputMethod = OutputMethod2, MyData = MyData,
##D  AgeRangeOptMale = AgeRangeOptMale, AgeRangeOptFemale = AgeRangeOptFemale, 
##D BegAgeCompMale = BegAgeCompMale, BegAgeCompFemale = BegAgeCompFemale, ShowPlot = T)
##D 
##D ## ---------- If the completion is not satisfying, we modify the values
##D ## ---------- AgeRangeOpt and BegAgeComp, and we repeat the previous script
##D ## ---------- CompletionA()
##D ## ---------- If the completion is satisfying, we execute
##D 
##D FinalMethod2 <- CompletionB(ModCompletion = CompletionMethod2, OutputMethod = OutputMethod2,
##D  MyData = MyData, Plot = T, Excel = T)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Validate method 2 by the 3rd level citeria                              ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute 3rd level criterions
##D 
##D ValidationLevel3Method2 <- ValidationLevel3(FinalMethod = FinalMethod2, MyData = MyData,
##D  Plot = T, Excel = T)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Coef Varition, Conf int. and rel. disp. of fitted per. life exp.        ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Compute the coefficient of variation, confidence intervals and
##D ## ---------- relative dispersion of the fitted perdiodic life expectancies
##D 
##D DispersionMethod2 <- Dispersion(FinalMethod = FinalMethod2, MyData = MyData, Plot = T, NbSim = 10)
##D 
##D ## ######################################################################## ##
##D ## METHOD 3 ############################################################### ##
##D ## ######################################################################## ##
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Execute method 3                                                        ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D OutputMethod3 <- Method3(MyData = MyData, AgeRange = AgeRange, Plot = T)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Validate method 3 by the 1st level citeria                              ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute 1st level citeria.
##D 
##D ValidationLevel1Method3 <- ValidationLevel1(OutputMethod = OutputMethod3, MyData = MyData,
##D  AgeCrit = AgeCrit, ValCrit = 0.05, Plot = T, Excel = T)
##D 
##D ## ---------- If the criterions corresponding to the 1st level are not 
##D ## ---------- satisfied, we turn to the method 4, and it is useless to
##D ## ---------- pursue the completion of the table and the validation.
##D ## ---------- If the criterions are satisfied, we continue the validation with
##D ## ---------- the criterions corresponding to the 2nd level.
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Validate method 3 by the 2nd level citeria                              ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute 2nd level criterions
##D 
##D ValidationLevel2Method3 <- ValidationLevel2(OutputMethod = OutputMethod3, MyData = MyData,
##D  AgeCrit = AgeCrit, ValCrit = 0.05, Excel = T)
##D 
##D ## ---------- If the criterions corresponding to the 2nd level are not satisfied
##D ## ---------- we turn to the method 4 and it is useless to pursue the 
##D ## ---------- completion of the table and the validation.
##D ## ---------- If the criterions are satisfied, we continue the validation with
##D ## ---------- the completion of the table and the criterions corresponding to
##D ## ---------- the 3rd level.
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Completion Method 3                                                     ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- We check if the completion is smoothed with graphical
##D ## ---------- diqgnostics.
##D 
##D CompletionMethod3 <- CompletionA(OutputMethod = OutputMethod3, MyData = MyData, 
##D AgeRangeOptMale = AgeRangeOptMale, AgeRangeOptFemale = AgeRangeOptFemale,
##D  BegAgeCompMale = BegAgeCompMale, BegAgeCompFemale = BegAgeCompFemale, ShowPlot = T)
##D 
##D ## ---------- If the completion is not satisfying, we modify the values
##D ## ---------- AgeRangeOpt and BegAgeComp, and we repeat the previous script
##D ## ---------- CompletionA()
##D ## ---------- If the completion is satisfying, we execute
##D 
##D FinalMethod3 <- CompletionB(ModCompletion = CompletionMethod3, OutputMethod = OutputMethod3,
##D MyData = MyData, Plot = T, Excel = T)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Validate method 3 by the 3rd level citeria                              ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute 3rd level criterions
##D 
##D ValidationLevel3Method3 <- ValidationLevel3(FinalMethod = FinalMethod3, MyData = MyData,
##D  Plot = T, Excel = T)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Coef Varition, Conf int. and rel. disp. of fitted per. life exp.        ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Compute the coefficient of variation, confidence intervals and
##D ## ---------- relative dispersion of the fitted perdiodic life expectancies
##D 
##D DispersionMethod3 <- Dispersion(FinalMethod = FinalMethod3, MyData = MyData, Plot = T, NbSim = 10)
##D 
##D ## ######################################################################## ##
##D ## METHOD 4 ############################################################### ##
##D ## ######################################################################## ##
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Execute method 4                                                        ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute method 4 first part.
##D 
##D OutputMethod4PartOne <- Method4A(MyData = MyData, AgeRange = AgeRange, AgeCrit = AgeCrit,
##D  ShowPlot = T)
##D 
##D ## ---------- Select the optimal smoothing parameters.
##D 
##D ## ---------- Execute method 4 second part.
##D 
##D OutputMethod4 <- Method4B(PartOne, MyData = MyData, OptMale = c(1, 16),
##D  OptFemale = c(1, 14), Plot = T)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Validate method 4 by the 1st level citeria                              ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute 1st level citeria.
##D 
##D ValidationLevel1Method4 <- ValidationLevel1(OutputMethod = OutputMethod4, MyData = MyData,
##D  AgeCrit = AgeCrit, ValCrit = 0.05, Plot = T, Excel = T)
##D 
##D ## ---------- If the criterions corresponding to the 1st level are not 
##D ## ---------- satisfied, we turn to the method 4, and it is useless to
##D ## ---------- pursue the completion of the table and the validation.
##D ## ---------- If the criterions are satisfied, we continue the validation with
##D ## ---------- the criterions corresponding to the 2nd level.
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Validate method 4 by the 2nd level citeria                              ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute 2nd level criterions
##D 
##D ValidationLevel2Method4 <- ValidationLevel2(OutputMethod = OutputMethod4, MyData = MyData,
##D  AgeCrit = AgeCrit, ValCrit = 0.05, Excel = T)
##D 
##D ## ---------- If the criterions corresponding to the 2nd level are not satisfied
##D ## ---------- we turn to the method 4 and it is useless to pursue the 
##D ## ---------- completion of the table and the validation.
##D ## ---------- If the criterions are satisfied, we continue the validation with
##D ## ---------- the completion of the table and the criterions corresponding to
##D ## ---------- the 3rd level.
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Completion Method 4                                                     ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- We check if the completion is smoothed with graphical
##D ## ---------- diqgnostics.
##D 
##D CompletionMethod4 <- CompletionA(OutputMethod = OutputMethod4, MyData = MyData,
##D  AgeRangeOptMale = AgeRangeOptMale, AgeRangeOptFemale = AgeRangeOptFemale, 
##D BegAgeCompMale = BegAgeCompMale, BegAgeCompFemale = BegAgeCompFemale, ShowPlot = T)
##D 
##D ## ---------- If the completion is not satisfying, we modify the values
##D ## ---------- AgeRangeOpt and BegAgeComp, and we repeat the previous script
##D ## ---------- CompletionA()
##D ## ---------- If the completion is satisfying, we execute
##D 
##D FinalMethod4 <- CompletionB(ModCompletion = CompletionMethod4, OutputMethod = OutputMethod4,
##D  MyData = MyData, Plot = T, Excel = T)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Validate method 4 by the 3rd level citeria                              ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Execute 3rd level criterions
##D 
##D ValidationLevel3Method4 <- ValidationLevel3(FinalMethod = FinalMethod4, MyData = MyData,
##D Plot = T, Excel = T)
##D 
##D ## ------------------------------------------------------------------------ ##
##D ##  Coef Varition, Conf int. and rel. disp. of fitted per. life exp.        ##
##D ## ------------------------------------------------------------------------ ##
##D 
##D ## ---------- Set the number of simulations
##D 
##D ## ---------- Compute the coefficient of variation, confidence intervals and
##D ## ---------- relative dispersion of the fitted perdiodic life expectancies
##D 
##D DispersionMethod4 <- Dispersion(FinalMethod = FinalMethod4, MyData = MyData, Plot = T, NbSim = 10)
##D 
##D ## ######################################################################## ##
##D ## COMPARISON OF THE METHODS ############################################## ##
##D ## ######################################################################## ##
##D 
##D ## ---------- Once we have fitted the data with a number of methods, we can
##D ## ---------- compare them. In the following, we compare the fitted
##D ## ---------- probabilities of death in original and log scale, the
##D ## ---------- residuals, the fitted deaths as well as the coherence of the
##D ## ---------- extrapolated mortality trends
##D 
##D ## ---------- You can change the color vector for comparison, color need to
##D ## ---------- be in html format
##D 
##D ## ---------- Store the output into a list
##D 
##D ListOutputs <- list(OutputMethod1, OutputMethod2, OutputMethod3, OutputMethod4)
##D ListValidationLevel1 <- list(ValidationLevel1Method1, ValidationLevel1Method2,
##D  ValidationLevel1Method3, ValidationLevel1Method4)
##D ListValidationLevel2 <- list(ValidationLevel2Method1, ValidationLevel2Method2,
##D  ValidationLevel2Method3, ValidationLevel2Method4)
##D ListValidationLevel3 <- list(ValidationLevel3Method1, ValidationLevel3Method2,
##D  ValidationLevel3Method3, ValidationLevel3Method4)
##D 
##D ComparisonsMethodsLevels123 <- ComparisonMethods(ListOutputs, ListValidationLevel1,
##D  ListValidationLevel2, ListValidationLevel3, MyData = MyData, Plot = T, AgeCrit = AgeCrit)
##D 
## End(Not run)



