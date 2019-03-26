library(polysat)


### Name: read.Structure
### Title: Read Genotypes and Other Data from a Structure File
### Aliases: read.Structure
### Keywords: file

### ** Examples

# create a file to read (normally done in a text editor or spreadsheet
# software)
cat("\t\tRhCBA15\tRhCBA23\tRhCBA28\tRhCBA14\tRUB126\tRUB262\tRhCBA6\tRUB26",
    "\t\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    "WIN1B\t1\t197\t98\t152\t170\t136\t208\t151\t99",
    "WIN1B\t1\t208\t106\t174\t180\t166\t208\t164\t99",
    "WIN1B\t1\t211\t98\t182\t187\t184\t208\t174\t99",
    "WIN1B\t1\t212\t98\t193\t170\t203\t208\t151\t99",
    "WIN1B\t1\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    "WIN1B\t1\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    "WIN1B\t1\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    "WIN1B\t1\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    "MCD1\t2\t208\t100\t138\t160\t127\t202\t151\t124",
    "MCD1\t2\t208\t102\t153\t168\t138\t207\t151\t134",
    "MCD1\t2\t208\t106\t157\t180\t162\t211\t151\t137",
    "MCD1\t2\t208\t110\t159\t187\t127\t215\t151\t124",
    "MCD1\t2\t208\t114\t168\t160\t127\t224\t151\t124",
    "MCD1\t2\t208\t124\t193\t160\t127\t228\t151\t124",
    "MCD1\t2\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    "MCD1\t2\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    "MCD2\t2\t208\t98\t138\t160\t136\t202\t150\t120",
    "MCD2\t2\t208\t102\t144\t174\t145\t214\t150\t132",
    "MCD2\t2\t208\t105\t148\t178\t136\t217\t150\t135",
    "MCD2\t2\t208\t114\t151\t184\t136\t227\t150\t120",
    "MCD2\t2\t208\t98\t155\t160\t136\t202\t150\t120",
    "MCD2\t2\t208\t98\t157\t160\t136\t202\t150\t120",
    "MCD2\t2\t208\t98\t163\t160\t136\t202\t150\t120",
    "MCD2\t2\t208\t98\t138\t160\t136\t202\t150\t120",
    "MCD3\t2\t197\t100\t172\t170\t159\t213\t174\t134",
    "MCD3\t2\t197\t106\t174\t178\t193\t213\t176\t132",
    "MCD3\t2\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    "MCD3\t2\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    "MCD3\t2\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    "MCD3\t2\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    "MCD3\t2\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    "MCD3\t2\t-9\t-9\t-9\t-9\t-9\t-9\t-9\t-9",
    sep="\n",file="structtest.txt")

# view the file
cat(readLines("structtest.txt"), sep="\n")

# read the structure file into genotypes and populations
testdata <- read.Structure("structtest.txt", ploidy=8)

# examine the results
testdata



