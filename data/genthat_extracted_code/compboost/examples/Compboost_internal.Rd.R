library(compboost)


### Name: Compboost_internal
### Title: Main Compboost Class
### Aliases: Compboost_internal

### ** Examples


# Some data:
df = mtcars
df$mpg.cat = ifelse(df$mpg > 20, 1, -1)

# # Create new variable to check the polynomial base-learner with degree 2:
# df$hp2 = df[["hp"]]^2

# Data for the baselearner are matrices:
X.hp = as.matrix(df[["hp"]])
X.wt = as.matrix(df[["wt"]])

# Target variable:
y = df[["mpg.cat"]]

data.source.hp = InMemoryData$new(X.hp, "hp")
data.source.wt = InMemoryData$new(X.wt, "wt")

data.target.hp1 = InMemoryData$new()
data.target.hp2 = InMemoryData$new()
data.target.wt1 = InMemoryData$new()
data.target.wt2 = InMemoryData$new()

# List for oob logging:
oob.data = list(data.source.hp, data.source.wt)

# List to test prediction on newdata:
test.data = oob.data

# Factories:
linear.factory.hp = BaselearnerPolynomial$new(data.source.hp, data.target.hp1, 1, TRUE)
linear.factory.wt = BaselearnerPolynomial$new(data.source.wt, data.target.wt1, 1, TRUE)
quadratic.factory.hp = BaselearnerPolynomial$new(data.source.hp, data.target.hp2, 2, TRUE)
spline.factory.wt = BaselearnerPSpline$new(data.source.wt, data.target.wt2, 3, 10, 2, 2)

# Create new factory list:
factory.list = BlearnerFactoryList$new()

# Register factories:
factory.list$registerFactory(linear.factory.hp)
factory.list$registerFactory(linear.factory.wt)
factory.list$registerFactory(quadratic.factory.hp)
factory.list$registerFactory(spline.factory.wt)

# Define loss:
loss.bin = LossBinomial$new()

# Define optimizer:
optimizer = OptimizerCoordinateDescent$new()

## Logger

# Define logger. We want just the iterations as stopper but also track the
# time, inbag risk and oob risk:
log.iterations  = LoggerIteration$new(TRUE, 500)
log.time        = LoggerTime$new(FALSE, 500, "microseconds")
log.inbag       = LoggerInbagRisk$new(FALSE, loss.bin, 0.05)
log.oob         = LoggerOobRisk$new(FALSE, loss.bin, 0.05, oob.data, y)

# Define new logger list:
logger.list = LoggerList$new()

# Register the logger:
logger.list$registerLogger(" iteration.logger", log.iterations)
logger.list$registerLogger("time.logger", log.time)
logger.list$registerLogger("inbag.binomial", log.inbag)
logger.list$registerLogger("oob.binomial", log.oob)

# Run compboost:
# --------------

# Initialize object:
cboost = Compboost_internal$new(
  response      = y,
  learning_rate = 0.05,
  stop_if_all_stopper_fulfilled = FALSE,
  factory_list = factory.list,
  loss         = loss.bin,
  logger_list  = logger.list,
  optimizer    = optimizer
)

# Train the model (we want to print the trace):
cboost$train(trace = 50)
cboost

# Get estimated parameter:
cboost$getEstimatedParameter()

# Get trace of selected base-learner:
cboost$getSelectedBaselearner()

# Set to iteration 200:
cboost$setToIteration(200)

# Get new parameter values:
cboost$getEstimatedParameter()




