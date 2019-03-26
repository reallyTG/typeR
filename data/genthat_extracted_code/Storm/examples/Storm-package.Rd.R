library(Storm)


### Name: Storm-package
### Title: Write Storm Bolts in R using the Storm Multi-Language Protocol.
### Aliases: Storm-package Storm-class Tuple-class Storm Tuple
### Keywords: storm hadoop

### ** Examples

#library(Storm)
#source("Storm/R/Storm.R")

#create a Storm object
storm = Storm$new();

#by default it has a handler that logs that the tuple was skipped.
#let's replace it that with something more interesting and equally
#useless.

storm$lambda = function(s) {
  #argument 's' is the Storm object.

  #get the current Tuple object.
  t = s$tuple;

  #optional: acknowledge receipt of the tuple.
  s$ack(t);

  #optional: log a message.
  s$log(c("processing tuple=",t$id));

  #create contrived tuples to illustrate output.

  #create 1st tuple...
  t$output = vector(mode="character",length=1);
  t$output[1] = as.numeric(t$input[3])+as.numeric(t$input[4]);
  #...and emit it.
  s$emit(t);

  #create 2nd tuple...
  t$output[1] = as.numeric(t$input[3])-as.numeric(t$input[4]);
  #...and emit it.
  s$emit(t);

  #alternative/optional: mark the tuple as failed.
  s$fail(t);
};

#enter the main tuple-processing loop.
storm$run();

#proton:R allenday$ cat Storm/eg/example.txt 
#{
#  "id": "-6955786537413359385",
#  "comp": "1",
#  "stream": "1",
#  "task": 9,
#  "tuple": ["snow white and the seven dwarfs", "field2", 3, 4]
#}
#end
#proton:R allenday$ cat Storm/eg/example.txt | Storm/eg/example.r 
#{
#  "command": "ack",
#  "id": "-6955786537413359385"
#}
#end
#{
#	"command": "log",
#	"msg": "processing tuple=-6955786537413359385"
#}
#end
#{
#	"command": "emit",
#	"anchors": [],
#	"stream": "1",
#	"task": "9",
#	"tuple": ["7"],
#}
#end
#{
#	"command": "emit",
#	"anchors": [],
#	"stream": "1",
#	"task": "9",
#	"tuple": ["-1"],
#}
#end
#{
#	"command": "fail",
#	"id": "-6955786537413359385"
#}
#end



