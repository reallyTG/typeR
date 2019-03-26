## Note that the message in case of error is not explicit enough
## Moreover, nothing is printed in case of success, while we would like a succinct report
library(svUnit)
clearLog()
runTest(svSuite("package:pastecs"), "pastecs")
errorLog()
